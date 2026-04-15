return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = ':TSUpdate',
  event = { 'BufReadPre', 'BufNewFile' }, -- lazy load on editing a file
  cmd = { 'TSInstall', 'TSInstallFromGrammar', 'TSUpdate', 'TSUninstall', 'TSLog' }, -- lazy load on commands
  config = function() -- `:help nvim-treesitter-intro`
    local parsers = { 'lua' }
    require('nvim-treesitter').install(parsers)

    local function treesitter_try_attach(buf, language)
      -- load parser
      if not vim.treesitter.language.add(language) then
        return
      end

      -- start treesitter highlighting
      vim.treesitter.start(buf, language)

      -- enable treesitter indentation if available
      local has_indent_query = vim.treesitter.query.get(language, 'indent') ~= nil
      if has_indent_query then
        vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
      end
    end

    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        local buf, filetype = args.buf, args.match

        local language = vim.treesitter.language.get_lang(filetype)
        if not language then
          return
        end

        local available_parsers = require('nvim-treesitter').get_available()
        local installed_parsers = require('nvim-treesitter').get_installed('parsers')

        if vim.tbl_contains(installed_parsers, language) then
          treesitter_try_attach(buf, language) -- enable parser if installed
        elseif vim.tbl_contains(available_parsers, language) then
          require('nvim-treesitter').install(language):await(function() -- automatically install the parser if available in nvim-treesitter
            treesitter_try_attach(buf, language) -- enable the parser after the installation
          end)
        else
          treesitter_try_attach(buf, language) -- try to enable the parser if it exists but is not available in nvim-treesitter
        end
      end,
    })
  end,
}

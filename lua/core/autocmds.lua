--[ autocommands ]-- `:help lua-guide-autocommands`

-- set indent to 2 spaces for lua files
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

-- remove inserting the current comment leader after hitting <Enter> or 'o'
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    vim.opt.formatoptions:remove({ 'o', 'r', 'c', 't' })
  end,
})

-- highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank()
  end,
})

-- run texlab `textDocument/build` method after write, run manually forward search with detached okular
-- and restart server afterwards to refresh diagnostics
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*.tex',
  callback = function(args)
    local texlab = vim.lsp.get_clients({ name = 'texlab', bufnr = args.buf })[1]
    local uri = vim.uri_from_bufnr(args.buf)
    local build_params = { textDocument = { uri = uri } }

    local tex_file = vim.api.nvim_buf_get_name(args.buf)
    local pdf_file = vim.fn.fnamemodify(tex_file, ':r') .. '.pdf'
    local cursor = vim.api.nvim_win_get_cursor(0)
    local line = cursor[1]

    -- callback to be run after build request
    local build_callback = function(_, result)
      vim.system({ 'okular', '--unique', string.format('file:%s#src:%d%s', pdf_file, line, tex_file) }, { detach = true })
      if result then
        vim.schedule(function()
          vim.cmd('lsp restart texlab')
        end)
      end
    end

    -- send build request to texlab
    texlab:request('textDocument/build', build_params, build_callback, args.buf)
  end,
})

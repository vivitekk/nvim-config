return {
  'nvim-mini/mini.statusline',
  version = false, -- install latest development version from main branch
  config = function()
    -- change highlight colors for active and inactive statusline groups
    vim.api.nvim_set_hl(0, 'StatusLine', { bg = '#12120F' })
    vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = '#625E5A', bg = '#12120F' })

    -- create transparent statusline highlight and set it locally for nvim-tree window
    vim.api.nvim_set_hl(0, 'StatusLineTransparent', { bg = 'NONE' })
    vim.api.nvim_create_autocmd('BufWinEnter', {
      callback = function()
        if vim.bo.filetype == 'NvimTree' then
          vim.schedule(function()
            vim.wo.winhighlight = 'StatusLine:StatusLineTransparent,StatusLineNC:StatusLineTransparent'
          end)
        end
      end,
    })

    -- set active statusline content ':help MiniStatusline-example-content'
    local active_content = function()
      -- compute string data for active content `:help statusline`
      local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
      local directory = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
      local git = MiniStatusline.section_git({ trunc_width = 40 })
      local diff = MiniStatusline.section_diff({ trunc_width = 75 })
      local diagnostics = MiniStatusline.section_diagnostics({
        trunc_width = 75,
        icon = '',
        signs = { ERROR = '\u{F530} ', WARN = '\u{F071} ', INFO = '\u{F449} ', HINT = '\u{F0820} ' },
      })
      local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 999 })

      -- return combined string groups
      if vim.bo.filetype == 'NvimTree' then
        return MiniStatusline.combine_groups({ { strings = {} } })
      end

      if vim.bo.filetype == 'help' then
        return MiniStatusline.combine_groups({
          { hl = mode_hl, strings = { mode } },
          { hl = 'MiniStatuslineFilename', strings = { '\u{F1074}', '%t' } },
        })
      end

      return MiniStatusline.combine_groups({
        { hl = mode_hl, strings = { mode } },
        { hl = 'MiniStatuslineFilename', strings = { '\u{F07B}', directory, '\u{F05F}', '%f' } },
        '%=',
        { hl = 'MiniStatuslineFilename', strings = { diagnostics, diff, git, fileinfo } },
        { hl = mode_hl, strings = { '\u{F09A8}', '%l/%L' } },
      })
    end

    -- set inactive statusline content
    local inactive_content = function()
      if vim.bo.filetype == 'NvimTree' then
        return MiniStatusline.combine_groups({ { strings = {} } })
      end
      return MiniStatusline.combine_groups({
        { hl = 'MiniStatuslineInactive', strings = { '\u{F05F}', '%f' } },
      })
    end

    require('mini.statusline').setup({
      content = {
        active = active_content,
        inactive = inactive_content,
      },
    })
  end,
}

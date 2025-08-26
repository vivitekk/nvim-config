return {
  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('kanagawa').setup({
      undercurl = false,
      commentStyle = { italic = false },
      keywordStyle = { italic = false },
      statementStyle = { bold = false },
      transparent = true,
      colors = {
        theme = {
          all = {
            ui = { bg_gutter = "none" }
          }
        }
      },
      overrides = function(colors)
        return {
          Normal = { fg = '#C5C9C5' },
          Constant = { fg = '#C5C9C5' },
          Identifier = { fg = '#C5C9C5' },
          Statement = { fg = '#C5C9C5' },
          PreProc = { fg = '#C5C9C5' },
          Type = { fg = '#C5C9C5' },
          Special = { fg = '#C5C9C5' },
          StatusLine = { fg = '#C5C9C5' },
          StatusLineNC = { fg = '#C5C9C5' },
          LineNr = { bg = 'none' },
          CursorLineNr = { bg = 'none' },
          Signcolumn = { bg = 'none' },
          MsgArea = { fg = '#C5C9C5' },
          ModeMsg = { fg = '#C5C9C5' },
          Pmenu = { bg = 'none', fg = '#C5C9C5' },
          PmenuSbar = { bg = 'none' },
          PmenuThumb = { bg = 'none' },
        }
      end,
      theme = 'dragon',
      background = {
        dark = 'dragon',
        light = 'lotus'
      }
    })
    vim.cmd.colorscheme('kanagawa-dragon')
  end
}

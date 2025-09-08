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
            ui = { bg_gutter = 'none' },
          },
        },
      },
      overrides = function(colors)
        return {
          -- make floating windows transparent
          NormalFloat = { bg = 'none' },
          FloatBorder = { bg = 'none' },
          FloatTitle = { bg = 'none' },
          -- dark and transparent completion menu
          Pmenu = { fg = colors.theme.ui.shade0, bg = 'none' },
          PmenuSel = { fg = 'none', bg = colors.theme.ui.bg_p2 },
          PmenuSbar = { bg = colors.theme.ui.bg_m1 },
          PmenuThumb = { bg = colors.theme.ui.bg_p2 },
        }
      end,
      theme = 'dragon',
      background = {
        dark = 'dragon',
        light = 'lotus',
      },
    })
    vim.cmd.colorscheme 'kanagawa-dragon'
  end,
}

return {
  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000,
  opts = {
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
        -- borderless Telescope UI
        TelescopeTitle = { fg = colors.theme.ui.special, bold = true },
        TelescopePromptNormal = { bg = colors.theme.ui.bg_p1 },
        TelescopePromptBorder = { fg = colors.theme.ui.bg_p1, bg = colors.theme.ui.bg_p1 },
        TelescopeResultsNormal = { fg = colors.theme.ui.fg_dim, bg = colors.theme.ui.bg_m1 },
        TelescopeResultsBorder = { fg = colors.theme.ui.bg_m1, bg = colors.theme.ui.bg_m1 },
        TelescopePreviewNormal = { bg = colors.theme.ui.bg_dim },
        TelescopePreviewBorder = { bg = colors.theme.ui.bg_dim, fg = colors.theme.ui.bg_dim },
      }
    end,
    theme = 'dragon',
    background = {
      dark = 'dragon',
      light = 'lotus',
    },
  },
  init = function()
    vim.cmd.colorscheme 'kanagawa-dragon'
  end,
}

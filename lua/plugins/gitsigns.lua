return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup({
      signs = {
        add = { text = '\u{F457}' },
        change = { text = '\u{F459}' },
        delete = { text = '\u{F458}' },
        topdelete = { text = '\u{F458}' },
        changedelete = { text = '\u{F45A}' },
        untracked = { text = '\u{F474}' },
      }
    })
  end
}

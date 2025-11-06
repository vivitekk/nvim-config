return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' }, -- lazy load on editing a file
  opts = {
    signs = {
      add = { text = '\u{F457}' },
      change = { text = '\u{F459}' },
      delete = { text = '\u{F458}' },
      topdelete = { text = '\u{F458}' },
      changedelete = { text = '\u{F45A}' },
      untracked = { text = '\u{F474}' },
    },
    signs_staged = {
      add = { text = '\u{F457}' },
      change = { text = '\u{F459}' },
      delete = { text = '\u{F458}' },
      topdelete = { text = '\u{F458}' },
      changedelete = { text = '\u{F45A}' },
      untracked = { text = '\u{F474}' },
    },
  },
}

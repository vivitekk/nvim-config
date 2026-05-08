---@module 'lazy'
---@type LazySpec
return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' }, -- lazy load on editing a file
  ---@module 'gitsigns'
  ---@type Gitsigns.Config
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    signs = {
      add = { text = '\u{F457}' }, ---@diagnostic disable-line: missing-fields
      change = { text = '\u{F459}' }, ---@diagnostic disable-line: missing-fields
      delete = { text = '\u{F458}' }, ---@diagnostic disable-line: missing-fields
      topdelete = { text = '\u{F458}' }, ---@diagnostic disable-line: missing-fields
      changedelete = { text = '\u{F45A}' }, ---@diagnostic disable-line: missing-fields
      untracked = { text = '\u{F474}' }, ---@diagnostic disable-line: missing-fields
    },
    signs_staged = {
      add = { text = '\u{F457}' }, ---@diagnostic disable-line: missing-fields
      change = { text = '\u{F459}' }, ---@diagnostic disable-line: missing-fields
      delete = { text = '\u{F458}' }, ---@diagnostic disable-line: missing-fields
      topdelete = { text = '\u{F458}' }, ---@diagnostic disable-line: missing-fields
      changedelete = { text = '\u{F45A}' }, ---@diagnostic disable-line: missing-fields
      untracked = { text = '\u{F474}' }, ---@diagnostic disable-line: missing-fields
    },
  },
}

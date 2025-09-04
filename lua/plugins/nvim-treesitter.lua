return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opts = {
    -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
    ensure_installed = { 'bash', 'c', 'cpp', 'json', 'lua', 'markdown', 'python', 'vim', 'vimdoc' },
    auto_install = false,
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  },
}

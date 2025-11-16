return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPre', 'BufNewFile' }, -- lazy load on editing a file
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = { 'lua' }, -- parsers to be installed from https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
    auto_install = true, -- automatically install missing parsers when entering buffers
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  },
}

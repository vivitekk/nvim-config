return {
  {
    'mason-org/mason.nvim',
    opts = {},
    cmd = { 'Mason' }, -- lazy load on command
  },
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = { 'mason-org/mason.nvim' },
    event = { 'BufReadPre', 'BufNewFile' }, -- lazy load on editing a file
    opts = {
      ensure_installed = { 'clangd', 'lua_ls' }, -- LSP servers
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'mason-org/mason.nvim' },
    event = { 'BufReadPre', 'BufNewFile' }, -- lazy load on editing a file
    opts = {
      ensure_installed = { 'clang-format', 'stylua' }, -- formatters
    },
  },
}

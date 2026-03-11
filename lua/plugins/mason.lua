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
      -- LSPs to be installed from https://mason-registry.dev/registry/list
      ensure_installed = { 'clangd', 'lua_ls' },
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'mason-org/mason.nvim' },
    event = { 'BufReadPre', 'BufNewFile' }, -- lazy load on editing a file
    opts = {
      -- debuggers, linters and formatters to be installed from https://mason-registry.dev/registry/list
      ensure_installed = { 'clang-format', 'stylua' },
      auto_update = true,
    },
    config = function(_, opts)
      require('mason-tool-installer').setup(opts)
      vim.schedule(function()
        vim.cmd('MasonToolsUpdate')
      end)
    end,
  },
}

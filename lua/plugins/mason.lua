---@module 'lazy'
---@type LazySpec
return {
  {
    'mason-org/mason.nvim',
    cmd = { 'Mason' }, -- lazy load on command
    ---@module 'mason'
    ---@type MasonSettings
    opts = {},
  },
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = { 'mason-org/mason.nvim' },
    event = { 'BufReadPre', 'BufNewFile' }, -- lazy load on editing a file
    ---@module 'mason-lspconfig'
    ---@type MasonLspconfigSettings
    opts = {
      -- LSPs to be installed from https://mason-registry.dev/registry/list
      ensure_installed = { 'clangd', 'lua_ls', 'texlab' },
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'mason-org/mason.nvim' },
    event = { 'BufReadPre', 'BufNewFile' }, -- lazy load on editing a file
    ---@module 'mason-tool-installer'
    ---@type MasonToolInstallerSettings
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

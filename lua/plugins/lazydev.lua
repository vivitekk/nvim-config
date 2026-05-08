---@module 'lazy'
---@type LazySpec
return {
  'folke/lazydev.nvim',
  ft = { 'lua' }, -- lazy load only on lua files
  ---@module 'lazydev'
  ---@type lazydev.Config
  opts = {
    library = {
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    },
  },
}

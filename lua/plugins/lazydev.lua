return {
  'folke/lazydev.nvim',
  ft = 'lua', -- lazy load only on lua files
  opts = {
    library = {
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    },
  },
}

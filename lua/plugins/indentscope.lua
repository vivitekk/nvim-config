return {
  'nvim-mini/mini.indentscope',
  event = { 'BufReadPre', 'BufNewFile' }, -- lazy load on editing a file
  ft = { 'NvimTree' }, -- lazy load on entering nvim-tree
  opts = {
    symbol = '\u{2502}',
  },
  config = function(_, opts)
    require('mini.indentscope').setup(opts)
    -- disable drawing indentscope line for certain filetypes
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'help', 'lazy', 'mason' },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}

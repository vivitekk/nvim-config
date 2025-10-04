return {
  'nvim-mini/mini.indentscope',
  opts = {
    symbol = '\u{2502}',
  },
  init = function()
    -- disable drawing indentscope line for certain filetypes
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'help', 'lazy', 'mason' },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}

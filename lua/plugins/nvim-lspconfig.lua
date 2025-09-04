return {
  'neovim/nvim-lspconfig',
  dependencies = { 'j-hui/fidget.nvim' }, -- LSP notifications UI
  config = function()
    vim.diagnostic.config({
      severity_sort = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '\u{F530} ',
          [vim.diagnostic.severity.WARN] = '\u{F071} ',
          [vim.diagnostic.severity.INFO] = '\u{F449} ',
          [vim.diagnostic.severity.HINT] = '\u{F400} ',
        },
      },
      virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }
          return diagnostic_message[diagnostic.severity]
        end,
      },
    })
  end,
}

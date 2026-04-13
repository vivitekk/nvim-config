return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' }, -- lazy load on save
  cmd = { 'ConformInfo' }, -- lazy load on command
  opts = {
    -- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
    formatters_by_ft = {
      cpp = { 'clang-format' },
      lua = { 'stylua' },
      tex = { 'tex-fmt' },
    },
    formatters = {
      ['tex-fmt'] = {
        inherit = true,
        prepend_args = {
          '--wraplen=130',
          '--tabsize=4',
        },
      },
    },
    format_on_save = { timeout_ms = 500 },
  },
}

return {
  'stevearc/conform.nvim',
  -- lazy load on save
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    -- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
    formatters_by_ft = {
      cpp = { 'clang-format' },
    },
    format_on_save = { timeout_ms = 500 },
  },
}

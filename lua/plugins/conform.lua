return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' }, -- lazy load on save
  cmd = { 'ConformInfo' }, -- lazy load on command
  opts = {
    -- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
    formatters_by_ft = {
      cpp = { 'clang-format' },
      lua = { 'stylua' },
      tex = { 'latexindent' },
    },
    formatters = {
      latexindent = {
        inherit = true,
        prepend_args = {
          '-m',
          '-y=defaultIndent:"    ",modifyLineBreaks:textWrapOptions:columns:130;multipleSpacesToSingle:1;when:after;comments:wrap:1',
          '-c=./build/',
        },
      },
        },
      },
    },
    format_on_save = { timeout_ms = 500 },
  },
}

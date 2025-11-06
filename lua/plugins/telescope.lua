return {
  'nvim-telescope/telescope.nvim',
  keys = {
    -- lazy load on keymaps
    { '<leader>ff', '<cmd>Telescope find_files<Enter>', 'n', desc = 'telescope find files' },
    { '<leader>lg', '<cmd>Telescope live_grep<Enter>', 'n', desc = 'telescope live grep' },
    { '<leader>ht', '<cmd>Telescope help_tags<Enter>', 'n', desc = 'telescope help tags' },
  },

  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-tree/nvim-web-devicons',
  },

  opts = {
    defaults = {
      prompt_prefix = '\u{276F} ',
      selection_caret = '  ',
      multi_icon = ' ',
      sorting_strategy = 'ascending',
      layout_config = {
        horizontal = {
          prompt_position = 'top',
          preview_width = 0.55,
          width = 0.9,
        },
      },
      mappings = {
        i = {
          ['<Tab>'] = 'move_selection_next',
          ['<S-Tab>'] = 'move_selection_previous',
        },
        n = {
          ['<Tab>'] = 'move_selection_next',
          ['<S-Tab>'] = 'move_selection_previous',
        },
      },
    },
    pickers = {},
    extensions = {},
  },

  config = function(_, opts)
    -- disable titles in telescope window
    local pickers = { 'find_files', 'help_tags', 'live_grep' }
    for _, picker in ipairs(pickers) do
      opts.pickers[picker] = vim.tbl_deep_extend('force', opts.pickers[picker] or {}, {
        prompt_title = false,
        results_title = false,
        preview_title = false,
      })
    end

    opts.extensions['ui-select'] =
      vim.tbl_deep_extend('force', opts.extensions['ui-select'] or {}, require('telescope.themes').get_dropdown())

    require('telescope').setup(opts)

    -- enable extensions
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
  end,
}

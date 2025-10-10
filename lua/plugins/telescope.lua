return {
  'nvim-telescope/telescope.nvim',
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
      prompt_title = false,
      results_title = false,
      preview_title = false,
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
    pickers = {
      find_files = {
        prompt_title = false,
        results_title = false,
        preview_title = false,
      },
      help_tags = {
        prompt_title = false,
        results_title = false,
        preview_title = false,
      },
      live_grep = {
        prompt_title = false,
        results_title = false,
        preview_title = false,
      },
    },
  },
  config = function(_, opts)
    require('telescope').setup(vim.tbl_deep_extend('force', opts, {
      extensions = {
        ['ui-select'] = { require('telescope.themes').get_dropdown() },
      },
    }))

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
  end,
}

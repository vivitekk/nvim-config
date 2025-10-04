return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    renderer = { root_folder_label = ':t' },
    hijack_cursor = true,
  },
  init = function()
    -- hide cursor in nvim-tree
    vim.api.nvim_create_autocmd({ 'WinEnter', 'BufWinEnter' }, {
      callback = function(data)
        local tree_api = require 'nvim-tree.api'
        local hl = vim.api.nvim_get_hl(0, { name = 'Cursor', link = false })
        if tree_api.tree.is_tree_buf(data.buf) then
          vim.api.nvim_set_hl(0, 'Cursor', { blend = 100, fg = hl.fg, bg = hl.bg })
          vim.opt_local.guicursor:append 'a:Cursor/lCursor'
        else
          vim.api.nvim_set_hl(0, 'Cursor', { blend = 0, fg = hl.fg, bg = hl.bg })
          vim.opt_local.guicursor:remove 'a:Cursor/lCursor'
        end
      end,
    })
  end,
}

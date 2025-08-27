--[[ autocommands ]]-- `:help lua-guide-autocommands`

-- set indent to 2 spaces for .lua files
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end
})

-- remove inserting the current comment leader after hitting <Enter> or 'o'
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    vim.opt.formatoptions:remove({ 'o', 'r' , 'c', 't' })
  end
})

-- highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank()
  end,
})

-- hide cursor in nvim-tree
vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
      callback = function(data)
        local tree_api = require("nvim-tree.api")
        local hl = vim.api.nvim_get_hl(0, { name = "Cursor", link = false })
        if tree_api.tree.is_tree_buf(data.buf) then
          vim.api.nvim_set_hl(0, "Cursor", { blend = 100, fg = hl.fg, bg = hl.bg })
          vim.opt_local.guicursor:append("a:Cursor/lCursor")
        else
          vim.api.nvim_set_hl(0, "Cursor", { blend = 0, fg = hl.fg, bg = hl.bg })
          vim.opt_local.guicursor:remove("a:Cursor/lCursor")
        end
      end,
})

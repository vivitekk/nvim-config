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

-- disable h and l motions in nvim-tree
--vim.api.nvim_create_autocmd("FileType", {
--  pattern = "NvimTree",
--  callback = function()
--    vim.keymap.set("n", "h", "<NOP>", { buffer = 0 })
--    vim.keymap.set("n", "l", "<NOP>", { buffer = 0 })
--  end,
--})

vim.cmd("hi NvimTreeCursorInvisible guifg=bg guibg=fg blend=0")
vim.cmd("set guicursor+=a:NvimTreeCursorInvisible/lNvimTreeCursorInvisible")

vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
  callback = function(data)
    local api = require("nvim-tree.api")
    if api.tree.is_tree_buf(data.buf) then
      vim.cmd("hi NvimTreeCursorInvisible blend=100")
    else
      vim.cmd("hi NvimTreeCursorInvisible blend=0")
    end
  end,
})

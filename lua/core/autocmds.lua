--[ autocommands ]-- `:help lua-guide-autocommands`

-- set indent to 2 spaces for .lua files
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

-- remove inserting the current comment leader after hitting <Enter> or 'o'
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    vim.opt.formatoptions:remove({ 'o', 'r', 'c', 't' })
  end,
})

-- highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank()
  end,
})

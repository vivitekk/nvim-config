--[ global variables ]-- `:help vim.g`

-- set <Space> as the leader key, `:help mapleader`
-- must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- disable netrw, so it doesn't interfere with nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set to true if a nerd font is installed and selected in the terminal
vim.g.have_nerd_font = true

-- disable support for node, perl, ruby and python to turn off warnings in checkhealth
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0

--[ options ]-- `:help vim.o`
require 'core.options'

--[ keymaps ]-- `:help vim.keymap.set`
require 'core.keymaps'

--[ autocommands ]-- `:help lua-guide-autocommands`
require 'core.autocmds'

--[ lazy.nvim plugin manager ]-- `:help lazy.nvim.txt`

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error('error cloning lazy.nvim:\n' .. out)
  end
end

vim.opt.rtp:prepend(lazypath)

-- setup lazy.nvim
require('lazy').setup({
  spec = {
    { import = 'plugins' }, -- import plugins specs from ~/.config/nvim/lua/plugins/
  },
  checker = { enabled = true }, -- automatically check for plugin updates
})

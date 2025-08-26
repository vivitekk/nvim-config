--[[ options ]]-- `:help vim.o`

-- tab and indenting
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- line numbers
vim.o.number = true
vim.o.relativenumber = true

-- remove '~' from empty lines at the end of a buffer
-- remove '|' from vertical separators
vim.opt.fillchars = { eob = ' ', vert = ' ' }

-- enable mouse support
vim.o.mouse = 'a'

-- don't show the mode since it's in the status line
vim.o.showmode = false

-- sync clipboard between OS and neovim
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- enable break indent
vim.o.breakindent = true

-- save undo history
vim.o.undofile = true

-- case-insensitive searching unless \C or the search pattern contains upper case characters
vim.o.ignorecase = true
vim.o.smartcase = true

-- keep signcolumn on by default and make it transparent
vim.o.signcolumn = 'yes'
vim.api.nvim_set_hl(0, 'Signcolumn', { bg = 'none' })

-- decrease update time
vim.o.updatetime = 250

-- decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- displaying of certain whitespace characters
-- (vim.opt offers an interface for conveniently interacting with tables)
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`) 
-- raise a dialog asking if you wish to save the current file(s)
vim.o.confirm = true

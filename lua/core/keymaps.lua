--[ keymaps ]-- `:help vim.keymap.set`

-- enter command-line mode easier
vim.keymap.set('n', ';', ':', { desc = 'enter command-line mode' })

-- split navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'move to the left split' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'move to the lower split' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'move to the upper split' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'move to the right split' })

-- split resizing
vim.keymap.set('n', '<C-Up>', '<cmd>resize +1<Enter>', { desc = 'increase current window height' })
vim.keymap.set('n', '<C-Down>', '<cmd>resize -1<Enter>', { desc = 'decrease current window height' })
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize +1<Enter>', { desc = 'increase current window width' })
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize -1<Enter>', { desc = 'decrease current window width' })

-- comment and uncomment text
vim.keymap.set('n', '<leader>/', 'gcc', { desc = 'comment or uncomment line', remap = true })
vim.keymap.set('v', '<leader>/', 'gc', { desc = 'comment or uncomment lines', remap = true })

-- clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<Enter>')

-- exit terminal mode with an easier shortcut than the default <C-\><C-n>
vim.keymap.set('t', '<leader><Esc>', '<C-\\><C-n>', { desc = 'exit terminal mode' })

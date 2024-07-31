vim.opt.shiftwidth= 4
vim.opt.tabstop = 4
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.colorcolumn = "80"

vim.o.number = true;
vim.o.relativenumber = true;

vim.o.background = "dark"
vim.cmd.colorscheme "ayu"

-- Maps
-- Half screen jumps
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Search to the center
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- Yank
vim.keymap.set('n', '<leader>y', "\"+y")
vim.keymap.set('v', '<leader>y', "\"+y")
vim.keymap.set('n', '<leader>Y', "\"+Y")

-- Jump between panes 
vim.keymap.set('n', '<C-k>', '<C-w><C-k>');
vim.keymap.set('n', '<C-j>', '<C-w><C-j>');
vim.keymap.set('n', '<C-h>', '<C-w><C-h>');
vim.keymap.set('n', '<C-l>', '<C-w><C-l>');

-- File Explore
vim.keymap.set('n', '<leader>bf', ':Explore!<Enter>')

-- Coding 
vim.keymap.set('n', 'gca', vim.lsp.buf.code_action);


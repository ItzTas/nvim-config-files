vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<C-o>:w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })


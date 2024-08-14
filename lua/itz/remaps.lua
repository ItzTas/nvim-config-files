vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-s>", ":lua Format_and_save()<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-s>", "<C-o>:lua Format_and_save()<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-s>", "<Esc>:lua Format_and_save()<CR>", { noremap = true, silent = true })
vim.keymap.set("c", "<C-s>", "<C-r>=w<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-i>", "O<Esc>")
vim.keymap.set("n", "<C-o>", "o<Esc>k")

vim.keymap.set("n", "<C-x>", "<C-v>")

vim.keymap.set({ "n", "v", "x", "o" }, "<C-c>", "<Esc>")

vim.keymap.set("n", "<C-z>", "<Nop>")

vim.keymap.set("x", "<leader>h", ":s/^/")
vim.keymap.set("x", "<leader>l", ":s/$/")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessioniner<CR>")

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>su", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

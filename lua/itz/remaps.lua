vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>o", function()
	vim.cmd("normal! mz")
	vim.cmd("normal! o")
	vim.cmd("normal! `z")
	vim.cmd("delmarks z")
end)

vim.keymap.set("n", "<leader>O", function()
	vim.cmd("normal! mz")
	vim.cmd("normal! O")
	vim.cmd("normal! `z")
	vim.cmd("delmarks z")
end)

vim.keymap.set({ "n", "v", "x", "o" }, "<C-c>", "<Esc>")

vim.keymap.set("n", "<C-z>", "<Nop>")

vim.keymap.set("x", "<leader>h", ":s/\\%V/")
vim.keymap.set("x", "<leader>l", ":s/$/")
vim.keymap.set("x", "<leader>s", ":s/\\%V.*\\%V\\(\\n\\)\\@!./")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

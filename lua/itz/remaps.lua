vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set({ "n", "x" }, "ç", "~h")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>o", function()
    local count = vim.v.count1
    for _ = 1, count do
        vim.cmd("normal! mz")
        vim.cmd("normal! o")
        vim.cmd("normal! `z")
        vim.cmd("delmarks z")
    end
end)

vim.keymap.set("n", "<leader>O", function()
    local count = vim.v.count1
    for _ = 1, count do
        vim.cmd("normal! mz")
        vim.cmd("normal! O")
        vim.cmd("normal! `z")
        vim.cmd("delmarks z")
    end
end)

vim.keymap.set("n", "<leader>-", "<C-w>s")
vim.keymap.set("n", "<leader>|", "<C-w>v")

vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.keymap.set("n", "<leader><", "<C-w><")
vim.keymap.set("n", "<leader>>", "<C-w>>")

vim.keymap.set({ "n", "v", "x", "o", "i" }, "<C-c>", "<Esc>")

vim.keymap.set("n", "<C-z>", "<Nop>")

vim.keymap.set("n", "<leader>w", 'yiW/<C-r>"<CR>')

vim.keymap.set("x", "<leader>w", 'y/<C-r>"<CR>')

vim.keymap.set("x", "<leader>l", ":s/$/")
vim.keymap.set("x", "<leader>s", ":s/\\%V.*\\%V\\(\\n\\)\\@!./")

vim.keymap.set("x", "<leader>S", 'y:%s/<C-r>"/<C-r>"/gI<Left><Left><Left>')

vim.keymap.set("x", "<leader>q", [[y:s/<C-r>"/<C-r>"/g<Left><Left>]])

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
vim.keymap.set({ "n", "v" }, "<leader>x", [["_x]])

vim.keymap.set("n", "<leader>q", [[:s/<C-r><C-w>/<C-r><C-w>/g<Left><Left>]])

vim.keymap.set("n", "gp", '"+p')
vim.keymap.set("n", "gP", '"+P')
vim.keymap.set("i", "<C-v>", '<ESC>"+pi')

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>S", 'yiW:%s/<C-r>"/<C-r>"/gI<Left><Left><Left>')

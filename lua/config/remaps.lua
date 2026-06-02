local fmt = require("functions.format")

vim.keymap.set("n", "<leader>f", fmt.format_file)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("i", "<C-BS>", "<C-w>")
vim.keymap.set("i", "<C-h>", "<C-w>")

do
    local function t()
        local trouble = require("trouble")

        vim.keymap.set("n", "<C-j>", function()
            if trouble.is_open() then
                trouble.next()
                trouble.jump()
            else
                vim.diagnostic.goto_next()
            end
        end)

        vim.keymap.set("n", "<C-k>", function()
            if trouble.is_open() then
                trouble.prev()
                trouble.jump()
            else
                vim.diagnostic.goto_prev()
            end
        end)
    end

    t()
end

vim.keymap.set("n", "<C-l>", function()
    vim.diagnostic.open_float(nil, { scope = "cursor" })
end)

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

vim.keymap.set("n", "<leader><", "<C-w><")
vim.keymap.set("n", "<leader>>", "<C-w>>")

vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]])
vim.keymap.set("t", "<C-BS>", "<C-w>")
vim.keymap.set("t", "<C-h>", "<C-w>")

vim.keymap.set({ "n", "v", "x", "o", "i" }, "<C-c>", "<Esc>")
vim.keymap.set("i", "ĉ", "<Esc>")

vim.keymap.set("n", "q:", "<Nop>")
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
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")

vim.keymap.set("i", "ŧ", "=>")

vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])



vim.keymap.set("n", "<leader>ex", ":!chmod +x %<CR>")
vim.keymap.set("n", "<leader>es", ":!exercism submit %<CR>")

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set({ "n", "v" }, "<leader>x", [["_x]])

vim.keymap.set("n", "<leader>q", [[:s/<C-r><C-w>/<C-r><C-w>/g<Left><Left>]])

vim.keymap.set("n", "gp", '"+p')
vim.keymap.set("n", "gP", '"+P')
vim.keymap.set("i", "<C-v>", '<ESC>"+pi')

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>S", 'yiW:%s/<C-r>"/<C-r>"/gI<Left><Left><Left>')



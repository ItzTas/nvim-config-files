vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set({ "n", "x" }, "ç", "~h")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

do
    local function t()
        local trouble = require("trouble")

        vim.keymap.set("n", "<C-j>", function()
            if trouble.is_open() then
                print("DEBUGPRINT[2]: trouble.lua:126 (after if trouble.is_open() then)")
                trouble.next()
                trouble.jump()
            else
                print("DEBUGPRINT[1]: trouble.lua:129 (after else)")
                vim.diagnostic.goto_next()
            end
        end)

        vim.keymap.set("n", "<C-k>", function()
            if trouble.is_open() then
                print("DEBUGPRINT[3]: trouble.lua:137 (after if trouble.is_open() then)")
                trouble.prev()
                trouble.jump()
            else
                print("DEBUGPRINT[4]: trouble.lua:141 (after else)")
                vim.diagnostic.goto_prev()
            end
        end)
    end

    t()
end

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
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

local function escape_pattern(str)
    return str:gsub("([%.%-%+%*%?%[%]%^%$%(%)])", "%%%1")
end

vim.g.escaped_word = ""

vim.keymap.set("n", "<leader>mr", function()
    local word = vim.fn.input("Grep > ")
    vim.g.escaped_word = escape_pattern(word)
    vim.cmd("vimgrep /" .. vim.g.escaped_word .. "/gn ./**")
    vim.cmd("copen")
end)

vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.keymap.set("n", "<C-j>", ":cnext<CR><C-w>j", { buffer = 0 })
        vim.keymap.set("n", "<C-k>", ":cprev<CR><C-w>j", { buffer = 0 })
        vim.keymap.set("n", "<C-r>", ":cdo %s/" .. vim.g.escaped_word .. "//gc<left><left><left>", { buffer = 0 })
    end,
})

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set({ "n", "v" }, "<leader>x", [["_x]])

vim.keymap.set("n", "<leader>q", [[:s/<C-r><C-w>/<C-r><C-w>/g<Left><Left>]])

vim.keymap.set("n", "gp", '"+p')
vim.keymap.set("n", "gP", '"+P')
vim.keymap.set("i", "<C-v>", '<ESC>"+pi')

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>S", 'yiW:%s/<C-r>"/<C-r>"/gI<Left><Left><Left>')

vim.keymap.set("n", "V", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("V", true, false, true), "n", true)
    vim.api.nvim_set_hl(0, "Visual", { bg = "#5e81ac", fg = "#ffffff" })
end)

vim.keymap.set("n", "v", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("v", true, false, true), "n", true)
    vim.api.nvim_set_hl(0, "Visual", { bg = "#5e81ac", fg = "#ffffff" })
end)

vim.keymap.set("v", "<C-p>", function()
    vim.api.nvim_set_hl(0, "Visual", { bg = "#5e81ac", fg = "#ffffff" })
end)

vim.keymap.set("n", "<C-v>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-v>", true, false, true), "n", true)
    vim.api.nvim_set_hl(0, "Visual", { bg = "#5e81ac", fg = "#ffffff" })
end)

vim.keymap.set("n", "<C-q>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-v>", true, false, true), "n", true)
    vim.api.nvim_set_hl(0, "Visual", { bg = "#5e81ac", fg = "#ffffff" })
end)

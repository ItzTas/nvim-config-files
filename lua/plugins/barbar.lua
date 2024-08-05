return {
    "romgrk/barbar.nvim",
    config = function()
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        map("n", "<Leader>p1", ":BufferGoto 1<CR>", opts)
        map("n", "<Leader>p2", ":BufferGoto 2<CR>", opts)
        map("n", "<Leader>p3", ":BufferGoto 3<CR>", opts)
        map("n", "<Leader>p4", ":BufferGoto 4<CR>", opts)
        map("n", "<Leader>p5", ":BufferGoto 5<CR>", opts)
        map("n", "<Leader>p6", ":BufferGoto 6<CR>", opts)
        map("n", "<Leader>p7", ":BufferGoto 7<CR>", opts)
        map("n", "<Leader>p8", ":BufferGoto 8<CR>", opts)
        map("n", "<Leader>p9", ":BufferGoto 9<CR>", opts)
        map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
    end,
}

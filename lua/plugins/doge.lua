return {
    "kkoomen/vim-doge",
    config = function()
        vim.g.doge_enable_mappings = 0
        vim.keymap.set("n", "<Leader>dg", "<Plug>(doge-generate)")

        vim.keymap.set("n", "<C-j>", "<Plug>(doge-comment-jump-forward)")
        vim.keymap.set("n", "<C-k>", "<Plug>(doge-comment-jump-backward)")
    end,
}

return {
    "easymotion/vim-easymotion",
    config = function()
        vim.api.nvim_set_keymap("n", "<leader>q", "<Plug>(easymotion-overwin-f)", { noremap = true, silent = true })
    end,
}
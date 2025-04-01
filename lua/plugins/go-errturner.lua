return {
    "ItzTas/go-erreturner.nvim",
    -- dir = "/home/talinux/workspace/github.com/ItzTas/vimPlugins/go-erreturner.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        local err_returner = require("go-erreturner")

        vim.keymap.set("n", "<leader>er", err_returner.return_err)

        vim.keymap.set("n", "<leader>el", err_returner.println_err)

        vim.keymap.set("n", "<leader>en", err_returner.return_new_err)
    end,
}

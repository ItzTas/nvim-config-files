return {
    "ItzTas/go-erreturner.nvim",
    dir = "/home/talinux/workspace/github.com/ItzTas/vimPlugins/go-erreturner.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        local err_returner = require("go-erreturner")

        require("go-erreturner").setup({
            error_variable_name = "err",
        })

        vim.keymap.set("n", "<leader>er", function()
            err_returner.return_err()
        end)

        vim.keymap.set("n", "<leader>el", function()
            err_returner.println_err()
        end)
    end,
}

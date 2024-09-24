return {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {},
    config = function()
        require("flash").setup({
            modes = {
                char = {
                    multi_line = false,
                },
            },
        })

        vim.keymap.set("n", "<leader>q", function()
            require("flash").jump({
                pattern = vim.fn.expand("<cword>"),
            })
        end)
    end,
}

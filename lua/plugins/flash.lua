return {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {},
    config = function()
        require("flash").setup({
            jump = {
                search = {
                    same_line = true,
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

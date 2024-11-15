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
                    keys = { "f", "F", "t", "T" },
                    multi_line = false,
                    highlight = { backdrop = false },
                },
            },
            highlight = {
                backdrop = false,
                matches = true,
            },
        })
    end,
}

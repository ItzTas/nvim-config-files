return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        ["'"] = {
            name = "Jump to Line",
            ["l"] = { ":JumpToLine<CR>", "Jump to Line" },
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}

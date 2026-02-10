return {
    "Wansmer/treesj",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        local treesj = require("treesj")
        treesj.setup({})

        vim.keymap.set("n", "<leader>mf", treesj.toggle)

        vim.keymap.set("n", "<leader>mt", function()
            require("treesj").toggle({ split = { recursive = true } })
        end)
    end,
}

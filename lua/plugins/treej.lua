return {
    "Wansmer/treesj",
    keys = {
        "<space>mf",
        "<space>mj",
        "<space>me",
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("treesj").setup({})
    end,
}

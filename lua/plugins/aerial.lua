return {
    "stevearc/aerial.nvim",
    opts = {},
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        require("aerial").setup({
            on_attach = function(bufnr)
                vim.keymap.set(
                    "n",
                    "]ne",
                    "<cmd>execute 'AerialPrev' . (v:count > 0 ? v:count : 1)<CR>",
                    { buffer = bufnr }
                )
                vim.keymap.set(
                    "n",
                    "[ne",
                    "<cmd>execute 'AerialNext' . (v:count > 0 ? v:count : 1)<CR>",
                    { buffer = bufnr }
                )
            end,
        })
        vim.keymap.set("n", "<leader>pa", "<cmd>AerialToggle!<CR>")
    end,
}

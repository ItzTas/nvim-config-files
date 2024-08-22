return {
    "lewis6991/gitsigns.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("gitsigns").setup({
            on_attach = function(bufnr)
                local gitsigns = require("gitsigns")

                -- Navigation
                vim.keymap.set("n", "]c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "]c", bang = true })
                    else
                        gitsigns.nav_hunk("next")
                    end
                end)

                vim.keymap.set("n", "[c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[c", bang = true })
                    else
                        gitsigns.nav_hunk("prev")
                    end
                end)

                -- Actions
                vim.keymap.set({ "v", "x" }, "<leader>ph", function()
                    gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end)
                vim.keymap.set({ "v", "x" }, "<leader>pr", function()
                    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end)
                vim.keymap.set("n", "<leader>ghu", gitsigns.undo_stage_hunk)
                vim.keymap.set("n", "<leader>pR", gitsigns.reset_buffer)
                vim.keymap.set("n", "<leader>pe", gitsigns.preview_hunk)
                vim.keymap.set("n", "<leader>gb", function()
                    gitsigns.blame_line({ full = true })
                end)
                -- Text object
                vim.keymap.set({ "o", "x" }, "<leader>c", ":<C-U>Gitsigns select_hunk<CR>")
            end,
        })
    end,
}

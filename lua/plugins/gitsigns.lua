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
                vim.keymap.set("n", "<leader>ghs", gitsigns.stage_hunk)
                vim.keymap.set("n", "<leader>ghr", gitsigns.reset_hunk)
                vim.keymap.set("v", "<leader>ghs", function()
                    gitsigns.stage_ghunk({ vim.fn.line("."), vim.fn.line("v") })
                end)
                vim.keymap.set("v", "<leader>ghr", function()
                    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end)
                vim.keymap.set("n", "<leader>ghS", gitsigns.stage_buffer)
                vim.keymap.set("n", "<leader>ghu", gitsigns.undo_stage_hunk)
                vim.keymap.set("n", "<leader>ghR", gitsigns.reset_buffer)
                vim.keymap.set("n", "<leader>ghp", gitsigns.preview_hunk)
                vim.keymap.set("n", "<leader>ghb", function()
                    gitsigns.blame_line({ full = true })
                end)
                vim.keymap.set("n", "<leader>gtb", gitsigns.toggle_current_line_blame)
                -- Text object
                vim.keymap.set({ "o", "x" }, "<leader>g", ":<C-U>Gitsigns select_hunk<CR>")
            end,
        })
    end,
}

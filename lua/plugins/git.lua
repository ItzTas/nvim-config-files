return {
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
            vim.keymap.set("n", "<leader>gd", vim.cmd.Gvdiffsplit)
            vim.keymap.set("n", "<leader>grl", vim.cmd.GlLog, { desc = "GlLog" })

            vim.keymap.set("n", "<leader>cm", ':Git commit -m ""<left>')
            vim.keymap.set("n", "<leader>pu", function()
                vim.cmd("Git push")
            end)
            vim.keymap.set("n", "<leader>pl", function()
                vim.cmd("Git pull --rebase")
            end)

            vim.keymap.set("n", "<leader>gl", function()
                vim.cmd("Git log")
            end, { desc = "git log" })

            vim.keymap.set("n", "<leader>gra", function()
                vim.cmd('Git log --oneline --graph --all --decorate --stat --pretty=format:"%h %d %s %an %ar"')
            end, { desc = "git graph" })

            vim.keymap.set("n", "<leader>grt", function()
                vim.cmd('Git log --oneline --graph --all --pretty=format:"%h %s"')
            end, { desc = "git graph minimal" })
        end,
    },
    {
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
                    vim.keymap.set({ "v", "x" }, "<leader>grh", function()
                        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                    end)
                    vim.keymap.set({ "v", "x" }, "<leader>grr", function()
                        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                    end)
                    vim.keymap.set("n", "<leader>gru", gitsigns.undo_stage_hunk)
                    vim.keymap.set("n", "<leader>grr", gitsigns.reset_buffer)
                    vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk)
                    vim.keymap.set("n", "<leader>gb", function()
                        gitsigns.blame_line({ full = true })
                    end)
                    -- Text object
                    vim.keymap.set({ "o", "x" }, "<leader>c", ":<C-U>Gitsigns select_hunk<CR>")
                end,
            })
        end,
    },
}

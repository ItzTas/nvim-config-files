return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local builtin = require("telescope.builtin")

            require("telescope").load_extension("ui-select")
            telescope.setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
                defaults = {
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-y>"] = actions.select_default,
                        },
                        n = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-y>"] = actions.select_default,
                        },
                    },
                },
            })

            vim.keymap.set("n", "<leader>jf", function()
                builtin.find_files()
            end, { desc = "Find Files" })

            vim.keymap.set("n", "<C-n>", function()
                builtin.git_files()
            end, { desc = "Find Git Files" })

            vim.keymap.set("n", "<leader>jw", function()
                local word = vim.fn.expand("<cword>")
                builtin.grep_string({ search = word })
            end)

            vim.keymap.set("n", "<leader>jW", function()
                local word = vim.fn.expand("<cWORD>")
                builtin.grep_string({ search = word })
            end)

            vim.keymap.set("n", "<leader>js", function()
                local word = vim.fn.input("Grep > ")
                builtin.grep_string({ search = word })
            end, { desc = "Grep String" })

            vim.keymap.set("n", "<leader>vh", builtin.help_tags)

            vim.keymap.set("n", "<leader>jk", builtin.live_grep)

            vim.keymap.set("n", "<leader>p[", function()
                builtin.colorscheme()
            end)

            vim.keymap.set("n", "<leader><leader>", function()
                builtin.oldfiles()
            end)

            vim.keymap.set("n", "<leader>jr", function()
                builtin.quickfix()
            end)

            vim.keymap.set("n", "<leader>jq", function()
                builtin.lsp_references()
            end)
        end,
    },
}

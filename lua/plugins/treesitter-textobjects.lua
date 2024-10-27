return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
        require("nvim-treesitter.configs").setup({
            textobjects = {
                select = {
                    enable = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",
                        ["ii"] = "@conditional.inner",
                        ["ai"] = "@conditional.outer",
                        ["ao"] = "@block.outer",
                        ["io"] = "@block.inner",
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",
                        ["ae"] = "@assignment.lhs",
                        ["ie"] = "@assignment.rhs",
                        ["aq"] = "@assignment.outer",
                        ["iq"] = "@assignment.inner",
                        ["ar"] = "@return.outer",
                        ["ir"] = "@return.inner",
                        ["in"] = "@number.inner",
                        ["iv"] = "@statement.outer",
                        ["am"] = "@comment.outer",
                        ["im"] = "@comment.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]c"] = "@class.outer",
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["]C"] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["[c"] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["[C"] = "@class.outer",
                    },
                },
                lsp_interop = {
                    enable = true,
                    border = "single",
                    floating_preview_opts = {},
                    peek_definition_code = {
                        ["<leader>df"] = "@function.outer",
                        ["<leader>dF"] = "@class.outer",
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["mn"] = "@parameter.inner",
                    },
                    swap_previous = {
                        ["mp"] = "@parameter.inner",
                    },
                },
            },
        })
    end,
}

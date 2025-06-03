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
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["]]"] = { query = "@class.outer", desc = "Next class start" },
                        ["]o"] = "@loop.*",
                        -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
                        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                        ["mp"] = "@parameter.inner",
                        ["ml"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
                        ["]nfs"] = "@function.outer",
                    },
                    goto_previous_start = {
                        ["MP"] = "@parameter.inner",
                        ["ML"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
                        ["[["] = "@class.outer",
                    },
                    goto_next_end = {
                        ["]nfe"] = "@function.outer",
                        ["]["] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["]nfo"] = "@function.outer",
                        ["[]"] = "@class.outer",
                    },
                    goto_next = {
                        ["[ni"] = "@conditional.outer",
                        ["mn"] = "@block.inner",
                    },
                    goto_previous = {
                        ["]ni"] = "@conditional.outer",
                        ["MN"] = "@block.inner",
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
                    swap_previous = {
                        ["MG"] = "@parameter.inner",
                    },
                    swap_next = {
                        ["mg"] = "@parameter.inner",
                    },
                },
            },
        })
    end,
}

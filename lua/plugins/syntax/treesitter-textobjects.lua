return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    enabled = true,
    branch = "main",
    config = function()
        local select = require("nvim-treesitter-textobjects.select")
        local move = require("nvim-treesitter-textobjects.move")
        local swap = require("nvim-treesitter-textobjects.swap")

        require("nvim-treesitter-textobjects").setup({
            select = {
                lookahead = true,
                include_surrounding_whitespace = false,
            },
            move = {
                set_jumps = true,
            },
        })

        -- =====================================================================
        -- Select keymaps
        -- =====================================================================
        local select_maps = {
            ["af"] = { "@function.outer", "textobjects" },
            ["if"] = { "@function.inner", "textobjects" },
            ["ac"] = { "@class.outer", "textobjects" },
            ["ic"] = { "@class.inner", "textobjects" },
            ["aa"] = { "@parameter.outer", "textobjects" },
            ["ia"] = { "@parameter.inner", "textobjects" },
            ["ii"] = { "@conditional.inner", "textobjects" },
            ["ai"] = { "@conditional.outer", "textobjects" },
            ["ao"] = { "@block.outer", "textobjects" },
            ["io"] = { "@block.inner", "textobjects" },
            ["al"] = { "@loop.outer", "textobjects" },
            ["il"] = { "@loop.inner", "textobjects" },
            ["ae"] = { "@assignment.lhs", "textobjects" },
            ["ie"] = { "@assignment.rhs", "textobjects" },
            ["aq"] = { "@assignment.outer", "textobjects" },
            ["iq"] = { "@assignment.inner", "textobjects" },
            ["ar"] = { "@return.outer", "textobjects" },
            ["ir"] = { "@return.inner", "textobjects" },
            ["in"] = { "@number.inner", "textobjects" },
            ["iv"] = { "@statement.outer", "textobjects" },
            ["am"] = { "@comment.outer", "textobjects" },
            ["im"] = { "@comment.inner", "textobjects" },
        }

        for key, args in pairs(select_maps) do
            vim.keymap.set({ "x", "o" }, key, function()
                select.select_textobject(args[1], args[2])
            end)
        end

        -- =====================================================================
        -- Move keymaps
        -- =====================================================================

        -- goto_next_start
        local next_start_maps = {
            ["]]"] = { "@class.outer", "textobjects", "Next class start" },
            ["]o"] = { { "@loop.inner", "@loop.outer" }, "textobjects" },
            ["]z"] = { "@fold", "folds", "Next fold" },
            ["mp"] = { "@parameter.inner", "textobjects" },
            ["ml"] = { "@local.scope", "locals", "Next scope" },
            ["]nfs"] = { "@function.outer", "textobjects" },
        }

        for key, args in pairs(next_start_maps) do
            vim.keymap.set({ "n", "x", "o" }, key, function()
                move.goto_next_start(args[1], args[2])
            end, { desc = args[3] })
        end

        -- goto_previous_start
        local prev_start_maps = {
            ["MP"] = { "@parameter.inner", "textobjects" },
            ["ML"] = { "@local.scope", "locals", "Previous scope" },
            ["[["] = { "@class.outer", "textobjects" },
        }

        for key, args in pairs(prev_start_maps) do
            vim.keymap.set({ "n", "x", "o" }, key, function()
                move.goto_previous_start(args[1], args[2])
            end, { desc = args[3] })
        end

        -- goto_next_end
        local next_end_maps = {
            ["]nfe"] = { "@function.outer", "textobjects" },
            ["]["] = { "@class.outer", "textobjects" },
        }

        for key, args in pairs(next_end_maps) do
            vim.keymap.set({ "n", "x", "o" }, key, function()
                move.goto_next_end(args[1], args[2])
            end)
        end

        -- goto_previous_end
        local prev_end_maps = {
            ["]nfo"] = { "@function.outer", "textobjects" },
            ["[]"] = { "@class.outer", "textobjects" },
        }

        for key, args in pairs(prev_end_maps) do
            vim.keymap.set({ "n", "x", "o" }, key, function()
                move.goto_previous_end(args[1], args[2])
            end)
        end

        -- goto_next (closest of start or end)
        local next_maps = {
            ["[ni"] = { "@conditional.outer", "textobjects" },
            ["mn"] = { "@block.inner", "textobjects" },
        }

        for key, args in pairs(next_maps) do
            vim.keymap.set({ "n", "x", "o" }, key, function()
                move.goto_next(args[1], args[2])
            end)
        end

        -- goto_previous (closest of start or end)
        local prev_maps = {
            ["]ni"] = { "@conditional.outer", "textobjects" },
            ["MN"] = { "@block.inner", "textobjects" },
        }

        for key, args in pairs(prev_maps) do
            vim.keymap.set({ "n", "x", "o" }, key, function()
                move.goto_previous(args[1], args[2])
            end)
        end

        -- =====================================================================
        -- Swap keymaps
        -- =====================================================================
        vim.keymap.set("n", "MG", function()
            swap.swap_previous("@parameter.inner")
        end)

        vim.keymap.set("n", "mg", function()
            swap.swap_next("@parameter.inner")
        end)
    end,
}

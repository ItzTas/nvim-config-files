return {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    keys = {
        {
            "<leader>mr",
            function()
                require("grug-far").open()
            end,
            desc = "Find and Replace (grug-far)",
        },
        {
            "<leader>mr",
            function()
                require("grug-far").with_visual_selection()
            end,
            mode = "v",
            desc = "Find and Replace selection (grug-far)",
        },
        {
            "<leader>mf",
            function()
                require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
            end,
            desc = "Find and Replace in current file (grug-far)",
        },
        {
            "<leader>mw",
            function()
                require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
            end,
            desc = "Find and Replace word under cursor (grug-far)",
        },
    },
    opts = {},
}

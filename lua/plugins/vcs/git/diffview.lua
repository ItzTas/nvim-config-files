return {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles" },
    keys = {
        { "<leader>gv", "<cmd>DiffviewOpen<CR>", desc = "Diffview: open" },
        { "<leader>gV", "<cmd>DiffviewClose<CR>", desc = "Diffview: close" },
        { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "Diffview: file history" },
        { "<leader>gH", "<cmd>DiffviewFileHistory<CR>", desc = "Diffview: repo history" },
    },
    opts = {
        enhanced_diff_hl = true,
        view = {
            merge_tool = {
                layout = "diff3_mixed",
            },
        },
    },
}

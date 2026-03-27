return {
    "lewis6991/gitsigns.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("gitsigns").setup({
            current_line_blame = true,
            on_attach = function(bufnr)
                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end
                local gitsigns = require("gitsigns")

                -- Navigation
                map("n", "]c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "]c", bang = true })
                    else
                        gitsigns.nav_hunk("next")
                    end
                end)

                map("n", "[c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[c", bang = true })
                    else
                        gitsigns.nav_hunk("prev")
                    end
                end)

                -- Actions
                map({ "v", "x" }, "<leader>grh", function()
                    gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end)
                map({ "v", "x" }, "<leader>grr", function()
                    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end)
                map("n", "<leader>gru", gitsigns.undo_stage_hunk)
                map("n", "<leader>grr", gitsigns.reset_buffer)
                map("n", "<leader>gp", gitsigns.preview_hunk)
                map("n", "<leader>gb", function()
                    gitsigns.blame_line({ full = true })
                end)
                -- Text object
                map({ "o", "x" }, "<leader>c", ":<C-U>Gitsigns select_hunk<CR>")
            end,
        })
    end,
}

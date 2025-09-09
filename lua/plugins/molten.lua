return {
    "https://github.com/benlubas/molten-nvim",
    dependencies = { "https://github.com/3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
        vim.g.python3_host_prog = vim.fn.expand(".venv/bin/python")
        vim.g.molten_kernel = "python3"

        vim.api.nvim_create_autocmd({ "BufEnter" }, {
            pattern = { "*.py", "*.md", "*.ipynb", "*.qmd" },
            callback = function(event)
                vim.keymap.set(
                    "n",
                    "<leader>mi",
                    ":MoltenInit<CR>",
                    { buffer = event.buf, silent = true, desc = "Initialize the plugin" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>me",
                    ":MoltenEvaluateOperator<CR>",
                    { buffer = event.buf, silent = true, desc = "run operator selection" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>rl",
                    ":MoltenEvaluateLine<CR>",
                    { buffer = event.buf, silent = true, desc = "evaluate line" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>mr",
                    ":MoltenReevaluateCell<CR>",
                    { buffer = event.buf, silent = true, desc = "re-evaluate cell" }
                )
                vim.keymap.set(
                    "v",
                    "<leader>r",
                    ":<C-u>MoltenEvaluateVisual<CR>gv",
                    { buffer = event.buf, silent = true, desc = "evaluate visual selection" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>rd",
                    ":MoltenDelete<CR>",
                    { buffer = event.buf, silent = true, desc = "molten delete cell" }
                )
                vim.keymap.set("n", "<leader>mh", ":MoltenHideOutput<CR>", { silent = true, desc = "hide output" })
                vim.keymap.set(
                    "n",
                    "<leader>ms",
                    ":noautocmd MoltenEnterOutput<CR>",
                    { buffer = event.buf, silent = true, desc = "show/enter output" }
                )
            end,
        })
    end,
}

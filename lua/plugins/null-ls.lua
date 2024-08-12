return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.code_actions.gomodifytags,
                null_ls.builtins.diagnostics.golangci_lint,
                null_ls.builtins.formatting.goimports_reviser,
                null_ls.builtins.diagnostics.staticcheck,
                null_ls.builtins.diagnostics.dotenv_linter,
                null_ls.builtins.formatting.prettierd.with({
                    extra_args = { "--single-quote", "--semi", "--jsx-single-quote" },
                }),
                require("none-ls.diagnostics.eslint"),
                require("none-ls.code_actions.eslint"),
                null_ls.builtins.formatting.shfmt,
                null_ls.builtins.formatting.goimports,
                null_ls.builtins.formatting.gofmt,
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}

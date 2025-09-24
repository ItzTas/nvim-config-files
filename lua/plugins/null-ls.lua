return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {

                -- null_ls.builtins.diagnostics.dotenv_linter,
                null_ls.builtins.diagnostics.actionlint,
                null_ls.builtins.diagnostics.yamllint.with({
                    extra_args = { "-d", "{rules: {document-start: false}}" },
                }),
                -- null_ls.builtins.diagnostics.markdownlint,
                null_ls.builtins.diagnostics.ltrs,
                null_ls.builtins.diagnostics.zsh,
                null_ls.builtins.diagnostics.hadolint,

                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.goimports,
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.formatting.goimports_reviser,
                -- null_ls.builtins.formatting.prettierd.with({
                --     -- extra_args = { "--single-quote", "--semi", "--jsx-single-quote" },
                --     extra_args = { "--semi" },
                --     disabled_filetypes = { "yaml" },
                --     filetypes = { "json", "typescript", "javascript", "typescriptreact", "javascriptreact" },
                -- }),
                null_ls.builtins.formatting.shfmt,
                null_ls.builtins.formatting.yamlfmt,
                -- null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.csharpier,
                null_ls.builtins.diagnostics.zsh,
                null_ls.builtins.formatting.shellharden,

                null_ls.builtins.code_actions.gomodifytags,
                require("none-ls.code_actions.eslint"),
                null_ls.builtins.code_actions.gitrebase,
                null_ls.builtins.code_actions.gitsigns,
            },
            large_file_skip_byte_limit = 0,
        })
    end,
}

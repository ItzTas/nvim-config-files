local null_ls = require("null-ls")

-- Definir a variável sources com todos os built-ins desejados
local sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.completion.spell,
    null_ls.builtins.code_actions.gomodifytags,
    null_ls.builtins.code_actions.impl,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.markdownlint,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.sqlfluff.with({
        extra_args = { "--dialect", "postgres" }, -- change to your dialect
    }),
    require("none-ls.diagnostics.eslint"),        -- requires none-ls-extras.nvim
    null_ls.builtins.diagnostics.staticcheck,
    null_ls.builtins.formatting.yamlfmt,
    null_ls.builtins.formatting.prettierd.with({
        extra_args = { "--single-quote", "--trailing-comma", "all", "--semi" }, -- Adicione suas opções aqui
    }),
    null_ls.builtins.hover.printenv,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
                desc = "[lsp] format on save",
            })

            -- Adicione um atalho para formatação manual
            vim.keymap.set("n", "<Leader>f", function()
                vim.lsp.buf.format({ bufnr = bufnr })
            end, { buffer = bufnr, desc = "[lsp] format manually" })
        end
    end,
    sources = sources,

    update_in_insert = true
})

vim.diagnostic.config({
    update_in_insert = true,
})

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
    require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
    null_ls.builtins.diagnostics.staticcheck,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.yamlfmt,
    null_ls.builtins.hover.printenv,
}

-- Configuração para formatar automaticamente ao salvar
local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- ou "BufWritePost"
local async = event == "BufWritePost"

local format_on_save = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
        vim.api.nvim_create_autocmd(event, {
            buffer = bufnr,
            group = group,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr, async = async })
            end,
            desc = "[lsp] format on save",
        })
    end
end

-- Configurar a formatação automática ao salvar
null_ls.setup({
    on_attach = function(client, bufnr)
        format_on_save(client, bufnr)
        -- Adicionar atalhos para formatação manual
        vim.keymap.set("n", "<Leader>f", function()
            vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
        end, { buffer = bufnr, desc = "[lsp] format" })
    end,

    sources = sources;

    update_in_insert = true
})

vim.diagnostic.config({
    update_in_insert = true,
})

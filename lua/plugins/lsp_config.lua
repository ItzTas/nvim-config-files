return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        lspconfig.lua_ls.setup({})
        lspconfig.tsserver.setup({})
        lspconfig.eslint.setup({})
        lspconfig.gopls.setup({})
        lspconfig.golangci_lint_ls.setup({})

        lspconfig.html.setup({
            capabilities = capabilities,
        })
        lspconfig.cssls.setup({
            capabilities = capabilities,
        })
        lspconfig.cssmodules_ls.setup({})

        vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover()
        end, { desc = "LSP Hover" })

        vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
        end, { desc = "Go to Definition" })

        vim.keymap.set("n", "gr", function()
            vim.lsp.buf.references()
        end, { desc = "Find References" })

        vim.keymap.set({ "n", "v" }, "<leader>ca", function()
            vim.lsp.buf.code_action()
        end, { desc = "Code Actions" })
    end,
}

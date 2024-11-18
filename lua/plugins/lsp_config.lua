return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "VonHeikemen/lsp-zero.nvim",
            dependencies = {
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-buffer",
                "neovim/nvim-lspconfig", -- Configuração de LSP
                "williamboman/mason.nvim", -- Gerenciador de servidores LSP
                "williamboman/mason-lspconfig.nvim", -- Integração com lspconfig
                "hrsh7th/nvim-cmp",      -- Autocompletar
                "hrsh7th/cmp-nvim-lsp",  -- Autocompletar para LSP
                "L3MON4D3/LuaSnip",      -- Snippets
            },
        },
        config = function()
            local lsp_zero = require("lsp-zero")
            local lsp_attach = function(client, bufnr)
                local opts = { buffer = bufnr, remap = false, desc = "LSP" }

                vim.keymap.set("n", "gd", function()
                    vim.lsp.buf.definition()
                end, opts)

                vim.keymap.set("n", "K", function()
                    vim.lsp.buf.hover()
                end, opts)

                vim.keymap.set("n", "<leader>vws", function()
                    vim.lsp.buf.workspace_symbol()
                end, opts)

                vim.keymap.set("n", "<leader>vd", function()
                    vim.diagnostic.open_float()
                end, opts)

                vim.keymap.set("n", "[d", function()
                    vim.diagnostic.goto_next()
                end, opts)

                vim.keymap.set("n", "]d", function()
                    vim.diagnostic.goto_prev()
                end, opts)

                vim.keymap.set("n", "<leader>ca", function()
                    vim.lsp.buf.code_action()
                end, opts)

                vim.keymap.set("n", "<leader>rf", function()
                    vim.lsp.buf.references()
                end, opts)

                vim.keymap.set("n", "<leader>rn", function()
                    vim.lsp.buf.rename()
                end, opts)

                vim.keymap.set("n", "<leader>h", function()
                    vim.lsp.buf.signature_help()
                end, opts)
            end

            lsp_zero.extend_lspconfig({
                sign_text = true,
                lsp_attach = lsp_attach,
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })

            local cmp = require("cmp")

            cmp.setup({
                sources = {
                    {
                        name = "nvim_lsp",
                        priority = 99,
                    },
                    {
                        name = "path",
                        priority = 5,
                    },
                    {
                        name = "buffer",
                        priority = 1,
                        option = {
                            keyword_length = 2,
                        },
                    },
                },
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },

                mapping = cmp.mapping.preset.insert({
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<C-y>"] = cmp.mapping.confirm({
                        select = true,
                    }),
                }),
            })

            -- cmp.setup.filetype({ "sql", "markdown" }, {})

            local lspconfig = require("lspconfig")
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            lspconfig.lua_ls.setup({})
            lspconfig.ts_ls.setup({})
            -- lspconfig.eslint.setup({})
            lspconfig.angularls.setup({})
            lspconfig.gopls.setup({})
            lspconfig.taplo.setup({})
            lspconfig.golangci_lint_ls.setup({})
            lspconfig.marksman.setup({})
            lspconfig.markdown_oxide.setup({})
            lspconfig.bashls.setup({})
            lspconfig.yamlls.setup({})
            lspconfig.basedpyright.setup({})
            lspconfig.pylsp.setup({})
            lspconfig.docker_compose_language_service.setup({})
            lspconfig.dockerls.setup({})
            lspconfig.html.setup({})
            lspconfig.jdtls.setup({})
            lspconfig.cssls.setup({})
            lspconfig.cssmodules_ls.setup({})
            lspconfig.css_variables.setup({})
            lspconfig.csharp_ls.setup({})
            lspconfig.jsonls.setup({})
            lspconfig.emmet_ls.setup({})
        end,
    },
}

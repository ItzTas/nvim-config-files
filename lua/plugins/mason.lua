return {
    {
        "williamboman/mason.nvim",
        opts = {},
        config = function()
            require("mason").setup({})
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        after = "nvim-lspconfig",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "ts_ls",
                    "eslint",
                    "lua_ls",
                    "gopls",
                    "golangci_lint_ls",
                    "marksman",
                    "markdown_oxide",
                    "hyprls",
                    "bashls",
                    "yamlls",
                    "html",
                    "cssls",
                    "cssmodules_ls",
                    "docker_compose_language_service",
                    "dockerls",
                },
                automatic_installation = true,
            })
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("plugins.null-ls")

            require("mason-null-ls").setup({
                automatic_installation = true,
            })
        end,
    },
}

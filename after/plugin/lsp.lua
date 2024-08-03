local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
local lspconfig = require('lspconfig')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

lspconfig.bashls.setup {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.cssls.setup {
    capabilities = capabilities,
}

lspconfig.dockerls.setup {}

lspconfig.cssmodules_ls.setup {}
lspconfig.css_variables.setup {}

lspconfig.marksman.setup {}
lspconfig.markdown_oxide.setup  {}

lspconfig.lua_ls.setup({})

lspconfig.html.setup {
    capabilities = capabilities,
}
lspconfig.gopls.setup({
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
})


lspconfig.golangci_lint_ls.setup({
    cmd = { "golangci-lint-langserver" },
    filetypes = { "go", "gomod" },
    root_dir = lspconfig.util.root_pattern('.golangci.yml', '.golangci.yaml', '.golangci.toml', '.golangci.json',
        'go.work', 'go.mod', '.git'),
    init_options = {
        command = { "golangci-lint", "run", "--out-format", "json" }
    },
})

lspconfig.eslint.setup({
    cmd = { "vscode-eslint-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_dir = lspconfig.util.root_pattern(".eslintrc.js", ".eslintrc.json", ".eslintrc.yaml", ".eslintrc.yml",
        "package.json", ".git"),
    settings = {
        codeAction = {
            disableRuleComment = {
                enable = true,
                location = "separateLine"
            },
            showDocumentation = {
                enable = true
            }
        },
        codeActionOnSave = {
            enable = true,
            mode = "all"
        },
        experimental = {
            useFlatConfig = false
        },
        format = true,
        nodePath = "",
        onIgnoredFiles = "off",
        problems = {
            shortenToSingleLine = false
        },
        quiet = false,
        rulesCustomizations = {},
        run = "onType",
        useESLintClass = true,
        validate = "on",
        workingDirectory = {
            mode = "location"
        }
    },
})

lspconfig.tsserver.setup {}

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space'] = cmp.mapping.complete(),
})

cmp.setup({
    mapping = cmp_mappings,
    -- outras configurações
})


lsp_zero.set_preferences({
    sign_icons = {
        error = "✘",
        warn = "⚠",
        info = "ℹ",
        hint = "➤"
    }
})

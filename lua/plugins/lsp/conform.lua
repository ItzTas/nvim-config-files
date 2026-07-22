return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            go = { "goimports_reviser", "goimports", "gofumpt" },
            python = { "black" },
            javascript = { "prettierd" },
            typescript = { "prettierd" },
            javascriptreact = { "prettierd", "rustywind" },
            typescriptreact = { "prettierd", "rustywind" },
            css = { "prettierd" },
            html = { "prettierd", "rustywind" },
            json = { "prettierd" },
            jsonc = { "prettierd" },
            markdown = { "prettierd" },
            yaml = { "yamlfmt" },
            rust = { "rustfmt" },
            kotlin = { "ktfmt" },
            sh = { "shfmt", "shellharden" },
            bash = { "shfmt", "shellharden" },
            -- shfmt/shellharden só entendem bash/POSIX e quebram sintaxe zsh
            -- (ex.: $BUFFER[CURSOR+1] -> $BUFFER[CURSOR + 1]). Sem formatter pra zsh.
            zsh = {},
            cs = { "csharpier" },
        },
    },
}

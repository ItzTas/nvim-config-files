return {
    "romus204/tree-sitter-manager.nvim",
    dependencies = {}, -- tree-sitter CLI deve estar instalado no sistema

    cond = function()
        return vim.fn.executable("tree-sitter") == 1
    end,

    config = function()
        require("tree-sitter-manager").setup({
            -- Default Options
            -- ensure_installed = {}, -- list of parsers to install at the start of a neovim session. If set to "all", install all parsers.
            border = "rounded", -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
            auto_install = true, -- se ativado, instala parsers faltando ao editar um arquivo novo
            -- highlight = true, -- treesitter highlighting is enabled by default
            -- languages = {}, -- override or add new parser sources
        })
    end,
}

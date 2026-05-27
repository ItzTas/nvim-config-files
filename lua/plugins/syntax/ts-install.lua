return {
    {
        "lewis6991/ts-install.nvim",
        enabled = false,
        config = function()
            require("ts-install").setup({
                -- Ativa a mágica: instala o parser assim que você abre um arquivo novo
                auto_install = true,

                -- Se quiser garantir alguns parsers instalados logo de cara:
                ensure_install = { "lua", "c", "markdown", "vim", "vimdoc" },
            })
        end,
    },
}

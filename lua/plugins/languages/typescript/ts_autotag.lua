return {
    "windwp/nvim-ts-autotag",
    config = function()
        require("nvim-ts-autotag").setup({
            opts = {
                enable_rename = true,
            },
        })
    end,
}

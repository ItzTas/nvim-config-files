return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR><C-w>h")
    end,
}

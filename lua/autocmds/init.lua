vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "v*",
    callback = function()
        vim.api.nvim_set_hl(0, "Visual", { bg = "#5e81ac", fg = "#ffffff" })
    end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.prototools",
    callback = function()
        vim.bo.filetype = "toml"
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "json",
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
    end,
})

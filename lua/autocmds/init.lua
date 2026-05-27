do
    local saved_visual_hl = {}

    local function save_visual_hl()
        local hl = vim.api.nvim_get_hl(0, { name = "Visual", link = false })
        if hl and next(hl) then
            saved_visual_hl = hl
        end
    end

    local function apply_visual_hl()
        if next(saved_visual_hl) then
            vim.api.nvim_set_hl(0, "Visual", saved_visual_hl)
        end
    end

    save_visual_hl()

    vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
            vim.schedule(save_visual_hl)
        end,
    })

    vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = "*:[vV\x16]",
        callback = apply_visual_hl,
    })

    vim.api.nvim_create_autocmd("FocusGained", {
        callback = apply_visual_hl,
    })
end

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

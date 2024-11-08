vim.api.nvim_create_user_command("W", "write", {})

vim.api.nvim_create_user_command("Settransparent", function()
    set_transparent_background()
end, {})

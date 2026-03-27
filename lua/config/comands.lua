vim.api.nvim_create_user_command("W", "write", {})

vim.api.nvim_create_user_command("Settransparent", function()
    set_transparent_background()
end, {})

if vim.g.started_by_firenvim then
    vim.api.nvim_create_user_command("Ex", function() end, {})
    vim.api.nvim_create_user_command("Explore", function() end, {})
end

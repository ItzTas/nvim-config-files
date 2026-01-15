local function short_path()
    local file = vim.fn.expand("%:t")
    local dir = vim.fn.expand("%:p:h:t")

    local result = dir .. "/" .. file

    result = result:gsub("[\\/]+$", "")

    return result
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        sections = {
            lualine_c = { short_path },
        },
    },
}

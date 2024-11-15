vim.g.mapleader = " "
-- vim.opt.termguicolors = true
require("config.lazy")
require("itz")
require("functions")

local _ = {
    "night-owl",
    "zenbones",
    "zenwritten",
    "zenburned",
    "apprentice",
    "nightfox",
    "dawnfox",
    "carbonfox",
    "terafox",
    "gotham",
    "monokai-pro",
    "monokai-pro-ristretto",
    "monokai-pro-machine",
    "monokai-pro-octagon",
    "monokai-pro-spectrum",
    "monokai-pro-classic",
    "material",
    "material-darker",
    "material-lighter",
    "material-ocean",
    "material-palenight",
    "ayu",
    "ayu-dark",
    "ayu-mirage",
    "ayu-light",
    "nord",
    "nordfox",
    "nordbones",
    "gruvbox",
    "solarized-dark",
    "solarized-light",
    "dracula",
    "PaperColor",
    "nightfly",
    "tokyonight-storm",
    "tokyonight-night",
    "tokyonight-day",
    "catppuccin-frappe",
    "catppuccin-latte",
    "catppuccin-macchiato",
    "catppuccin-mocha",
    "rose-pine",
    "rose-pine-dawn",
    "rose-pine-moon",
    "wildcharm",
    "torte",
    "duckbones",
    "vim",
    "slate",
    "retrobox",
    "randombones",
    "peachpuff",
    "koehler",
    "habamax",
}

vim.cmd("colorscheme rose-pine-moon")
set_transparent_background()

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*" },
    callback = function()
        require("gitsigns").toggle_current_line_blame()
    end,
})

vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "v*",
    callback = function()
        vim.api.nvim_set_hl(0, "Visual", { bg = "#5e81ac", fg = "#ffffff" })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        local clients = vim.lsp.buf_get_clients(0)
        if next(clients) ~= nil then
            for _, client in pairs(clients) do
                vim.lsp.buf_detach_client(0, client.id)
            end
        end

        vim.cmd("set relativenumber")
        vim.cmd("set number")
    end,
})

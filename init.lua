vim.g.mapleader = " "
vim.opt.termguicolors = true
require("config.lazy")
require("itz")
require("itz.set")
require("itz.remaps")

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

vim.cmd("colorscheme ayu")

local function set_transparent_background()
    local transparent_groups = {
        "Normal",
        "NormalFloat",
        "LineNr",
        "CursorLineNr",
        "SignColumn",
        "WinSeparator",
        "Pmenu",
        "TabLine",
        "FoldColumn",
        "Folded",
        "FloatBorder",
        "WildMenu",
    }

    for _, group in ipairs(transparent_groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none", fg = "none" })
    end
end

set_transparent_background()

vim.keymap.set("n", "<leader>px", function()
    set_transparent_background()
end)

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.*" },
    callback = function()
        require("gitsigns").toggle_current_line_blame()
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
    end,
})

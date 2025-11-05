vim.g.mapleader = " "
vim.g.maplocalleader = "ç"
-- vim.opt.termguicolors = true
require("config.lazy")
require("functions")
require("itz")

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

vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "v*",
    callback = function()
        vim.api.nvim_set_hl(0, "Visual", { bg = "#5e81ac", fg = "#ffffff" })
    end,
})

vim.api.nvim_create_autocmd({"BufRead","BufNewFile"}, {
  pattern = "*.prototools",
  callback = function()
    vim.bo.filetype = "toml"
  end
})


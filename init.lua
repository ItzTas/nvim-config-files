vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Install deprecation shims before any plugin spec evaluates (manager bootstraps
-- lazy.nvim). config/init.lua re-requires this later, but require() caches it.
require("config.deprecations")

require("manager")
require("commands")
require("config")

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

local bg = require("functions.background")

bg.set_transparent_background()

require("autocmds")


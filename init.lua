vim.g.mapleader = " "
require("config.lazy")
require("itz")
require("itz.set")
require("itz.remaps")
require("functions")
vim.cmd("colorscheme catppuccin")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.g.mapleader = " "
vim.opt.termguicolors = true
require("config.lazy")
require("itz")
require("itz.set")
require("itz.remaps")

local my_themes = {
	"night-owl",
	"zenbones",
	"apprentice",
	"nightfox",
	"gotham",
	"monokai-pro",
	"material",
	"ayu",
	"nord",
	"gruvbox",
	"solarized",
	"dracula",
	"PaperColor",
	"nightfly",
	"tokyonight",
	"catppuccin",
	"rose-pine",
}

vim.cmd("colorscheme gotham")

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

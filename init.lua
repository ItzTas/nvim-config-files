vim.g.mapleader = " "
require("config.lazy")
require("itz")
require("itz.set")
require("itz.remaps")
vim.cmd("colorscheme rose-pine")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_create_user_command("W", "write", {})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*.*" },
	callback = function()
		require("gitsigns").toggle_current_line_blame()
	end,
})

return {
	"RRethy/vim-illuminate",
	event = "BufReadPost",
	enabled = false,
	config = function()
		require("illuminate").configure({
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			delay = 200,
			under_cursor = true,
			filetypes_denylist = {
				"oil",
				"qf",
				"fugitive",
				"TelescopePrompt",
			},
		})

		vim.api.nvim_set_hl(0, "IlluminatedWordText", { underline = true })
		vim.api.nvim_set_hl(0, "IlluminatedWordRead", { underline = true })
		vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { underline = true })
	end,
}

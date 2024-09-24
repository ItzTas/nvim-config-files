return {
	"Wansmer/treesj",
	keys = {
		"<leader>mf",
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("treesj").setup({})
	end,
}

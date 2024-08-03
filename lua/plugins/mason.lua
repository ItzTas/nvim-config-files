return {
	"williamboman/mason.nvim",
	opts = {},
	config = function()
		require("mason").setup({
			automatic_installation = true,
		})
	end,
}

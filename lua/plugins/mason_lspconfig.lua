return {
	"williamboman/mason-lspconfig.nvim",
	after = "nvim-lspconfig",
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "tsserver" },
			automatic_installation = true,
		})
	end,
}

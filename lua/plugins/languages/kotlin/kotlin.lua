-- JetBrains' official kotlin-lsp (alpha) via kotlin.nvim.
-- Server binary comes from Mason: `:MasonInstall kotlin-lsp`.
-- NOTE: do NOT add `kotlin_lsp` to `vim.lsp.enable`/mason-lspconfig — kotlin.nvim
-- starts the server itself and doubling it causes conflicts.
return {
	"AlexandrosAlexiou/kotlin.nvim",
	ft = { "kotlin" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"stevearc/oil.nvim",
		"folke/trouble.nvim",
	},
	config = function()
		require("kotlin").setup({
			jvm_args = { "-Xmx4g" },
			inlay_hints = {
				enabled = true,
			},
		})
	end,
}

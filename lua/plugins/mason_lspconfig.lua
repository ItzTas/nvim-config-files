return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	after = "nvim-lspconfig",
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"ts_ls",
				"pylsp",
				"eslint",
				"lua_ls",
				"gopls",
				"golangci_lint_ls",
				"marksman",
				"markdown_oxide",
				"bashls",
				"yamlls",
				"html",
				"cssls",
				"cssmodules_ls",
				"docker_compose_language_service",
				"dockerls",
			},
			automatic_installation = true,
		})
	end,
}

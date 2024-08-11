return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"VonHeikemen/lsp-zero.nvim",
			dependencies = {
				"neovim/nvim-lspconfig", -- Configuração de LSP
				"williamboman/mason.nvim", -- Gerenciador de servidores LSP
				"williamboman/mason-lspconfig.nvim", -- Integração com lspconfig
				"hrsh7th/nvim-cmp", -- Autocompletar
				"hrsh7th/cmp-nvim-lsp", -- Autocompletar para LSP
				"L3MON4D3/LuaSnip", -- Snippets
			},
		},
		config = function()
			local lsp_zero = require("lsp-zero")
			local cmp = require("cmp")
			lsp_zero.on_attach(function(client, bufnr)
				local opts = { buffer = bufnr, remap = false, desc = "LSP" }

				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, opts)
				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover()
				end, opts)
				vim.keymap.set("n", "<leader>vws", function()
					vim.lsp.buf.workspace_symbol()
				end, opts)
				vim.keymap.set("n", "<leader>vd", function()
					vim.diagnostic.open_float()
				end, opts)
				vim.keymap.set("n", "[d", function()
					vim.diagnostic.goto_next()
				end, opts)
				vim.keymap.set("n", "]d", function()
					vim.diagnostic.goto_prev()
				end, opts)
				vim.keymap.set("n", "<leader>ca", function()
					vim.lsp.buf.code_action()
				end, opts)
				vim.keymap.set("n", "<leader>rf", function()
					vim.lsp.buf.references()
				end, opts)
				vim.keymap.set("n", "<leader>rn", function()
					vim.lsp.buf.rename()
				end, opts)
				vim.keymap.set("n", "<C-h>", function()
					vim.lsp.buf.signature_help()
				end, opts)
			end)
			lsp_zero.preset("recommended")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			local cmp_mappings = lsp_zero.defaults.cmp_mappings({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<Tab>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space"] = cmp.mapping.complete(),
			})

			cmp.setup({
				mapping = cmp_mappings,
			})

			local lspconfig = require("lspconfig")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			lspconfig.lua_ls.setup({})
			lspconfig.tsserver.setup({})
			lspconfig.eslint.setup({})
			lspconfig.gopls.setup({})
			lspconfig.golangci_lint_ls.setup({})
			lspconfig.marksman.setup({})
			lspconfig.markdown_oxide.setup({})
			lspconfig.bashls.setup({})

			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.cssmodules_ls.setup({})

			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, { desc = "LSP Hover" })

			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, { desc = "Go to Definition" })

			vim.keymap.set("n", "gr", function()
				vim.lsp.buf.references()
			end, { desc = "Find References" })

			vim.keymap.set({ "n", "v" }, "<leader>ca", function()
				vim.lsp.buf.code_action()
			end, { desc = "Code Actions" })
		end,
	},
}

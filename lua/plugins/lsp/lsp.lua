return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
		},
		config = function()
			local lsp_attach = function(client, bufnr)
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

				vim.keymap.set("n", "<leader>h", function()
					vim.lsp.buf.signature_help()
				end, opts)
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					lsp_attach(client, event.buf)
				end,
			})

			vim.lsp.config("*", {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			require("luasnip.loaders.from_vscode").lazy_load()

			local cmp = require("cmp")

			cmp.setup({
				sources = {
					{
						name = "nvim_lsp",
						priority = 99,
					},
					{
						name = "luasnip",
						priority = 80,
					},
					{
						name = "path",
						priority = 30,
					},
					{
						name = "buffer",
						priority = 10,
						option = {
							keyword_length = 2,
						},
					},
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

				mapping = {
					["<Home>"] = cmp.mapping.confirm({
						select = true,
					}),
					["<C-n>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<C-y>"] = cmp.mapping.confirm({
						select = true,
					}),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),

					["<C-j>"] = cmp.mapping(function(fallback)
						local luasnip = require("luasnip")

						if cmp.visible() then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							cmp.complete()
						end
					end, { "i", "s" }),

					["<C-k>"] = cmp.mapping(function(fallback)
						local luasnip = require("luasnip")

						if cmp.visible() then
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							cmp.complete()
						end
					end, { "i", "s" }),
				},
			})

			vim.lsp.enable({
				"eslint",
				"lua_ls",
				"jdtls",
				"prismals",
				"hyprls",
				"gopls",
				"taplo",
				"golangci_lint_ls",
				"marksman",
				"markdown_oxide",
				"bashls",
				"taplo",
				"yamlls",
				"rust_analyzer",

				-- "phpactor",
				"intelephense",

				-- Python
				"basedpyright",
				-- "pyright",
				"ruff",

				"dockerls",
				"docker_language_server",

				"html",
				"svelte",
				"vtsls",
				"vue_ls",

				"cssls",
				"cssmodules_ls",
				"css_variables",
				"tailwindcss",

				"csharp_ls",
				"jsonls",
				"emmet_ls",
			})

			local default_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]
			vim.lsp.config("bashls", {
				handlers = {
					["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
						local fname = vim.fn.fnamemodify(vim.uri_to_fname(result.uri), ":t")
						if fname:match("^%.env") then
							return
						end
						default_handler(err, result, ctx, config)
					end,
				},
			})

			local vue_language_server_path = vim.fn.stdpath("data")
				.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

			vim.lsp.config("vtsls", {
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
					"vue",
				},
				settings = {
					typescript = {
						tsdk = ".yarn/sdks/typescript/lib",
					},
					vtsls = {
						autoUseWorkspaceTsdk = true,
						tsserver = {
							globalPlugins = {
								{
									name = "@vue/typescript-plugin",
									location = vue_language_server_path,
									languages = { "vue" },
									configNamespace = "typescript",
									enableForWorkspaceTypeScriptVersions = true,
								},
							},
						},
					},
				},
			})

			-- pylsp é auto-habilitado pelo mason-lspconfig (automatic_installation);
			-- o ruff já faz o lint, então só alinhamos o pycodestyle ao limite do
			-- ruff (88) para não duplicar E501 no default 79.
			vim.lsp.config("pylsp", {
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = { maxLineLength = 88 },
						},
					},
				},
			})

			vim.lsp.config("taplo", {
				cmd = { "taplo", "lsp", "stdio" },
				filetypes = { "toml" },
				root_markers = { ".taplo.toml", "taplo.toml", ".git" },
			})

			vim.lsp.config("cssls", {
				settings = {
					css = {
						lint = {
							unknownAtRules = "ignore",
						},
					},
					scss = {
						lint = {
							unknownAtRules = "ignore",
						},
					},
					less = {
						lint = {
							unknownAtRules = "ignore",
						},
					},
				},
			})

			vim.lsp.config("svelte", {
				root_dir = function(bufnr, on_dir)
					local fname = vim.api.nvim_buf_get_name(bufnr)
					if vim.uv.fs_stat(fname) == nil then
						return
					end
					local root = vim.fs.root(bufnr, {
						"svelte.config.js",
						"svelte.config.ts",
						"svelte.config.mjs",
						"svelte.config.cjs",
					})
					if root then
						on_dir(root)
					end
				end,
				cmd = function(dispatchers, config)
					local root = (config and config.root_dir) or vim.uv.cwd()
					local sdk = root .. "/.yarn/sdks/svelte-language-server/bin/server.js"
					local cmd = vim.uv.fs_stat(sdk) and { "node", sdk, "--stdio" } or { "svelteserver", "--stdio" }
					return vim.lsp.rpc.start(cmd, dispatchers)
				end,
			})

			vim.lsp.config("rust_analyzer", {
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
						checkOnSave = true,
						check = {
							command = "clippy",
						},
					},
				},
			})
		end,
	},
}

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local builtin = require("telescope.builtin")
			local finders = require("telescope.finders")
			local config = require("telescope.config")
			local make_entry = require("telescope.make_entry")

			local function live_grep_with_glob()
				builtin.live_grep({
					additional_args = function()
						return { "--glob", "!.git" }
					end,
					on_input_filter_cb = function(prompt)
						local search, glob = prompt:match("(.-)  (.*)")
						if search and glob then
							return {
								prompt = search,
								updated_finder = finders.new_job(function()
									return vim.tbl_flatten({
										config.values.vimgrep_arguments,
										"--glob",
										glob,
										"--",
										search,
									})
								end, make_entry.gen_from_vimgrep({})),
							}
						end
					end,
				})
			end

			require("telescope").load_extension("ui-select")
			telescope.setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				defaults = {
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-y>"] = actions.select_default,
						},
						n = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-y>"] = actions.select_default,
						},
					},
				},
			})

			vim.keymap.set("n", "<leader>jf", function()
				builtin.find_files()
			end, { desc = "Find Files" })

			vim.keymap.set("n", "<C-n>", function()
				builtin.git_files()
			end, { desc = "Find Git Files" })

			vim.keymap.set("n", "<leader>jw", function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end)

			vim.keymap.set("n", "<leader>jW", function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end)

			vim.keymap.set("n", "<leader>js", function()
				local word = vim.fn.input("Grep > ")
				builtin.grep_string({ search = word })
			end, { desc = "Grep String" })

			vim.keymap.set("n", "<leader>vh", builtin.help_tags)

			vim.keymap.set("n", "<leader>jk", live_grep_with_glob, { desc = "Live Grep (double-space for glob filter)" })

			vim.keymap.set("n", "<leader>p[", function()
				builtin.colorscheme()
			end)

			vim.keymap.set("n", "<leader><leader>", function()
				builtin.oldfiles()
			end)

			vim.keymap.set("n", "<leader>jr", function()
				builtin.quickfix()
			end)

			vim.keymap.set("n", "<leader>jq", function()
				builtin.lsp_references()
			end)
		end,
	},
}

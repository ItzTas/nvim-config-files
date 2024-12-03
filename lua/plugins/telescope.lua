return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
		},
		opts = {
			defaults = {
				mappings = {
					i = {
						["<C-u>"] = false,
						["<C-d>"] = false,
					},
				},
			},
		},
		config = function()
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>pf", function()
				builtin.find_files()
			end, { desc = "Find Files" })

			vim.keymap.set("n", "<C-p>", function()
				builtin.git_files()
			end, { desc = "Find Git Files" })

			vim.keymap.set("n", "<leader>pw", function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end)

			vim.keymap.set("n", "<leader>pW", function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end)

			vim.keymap.set("n", "<leader>ps", function()
				local word = vim.fn.input("Grep > ")
				builtin.grep_string({ search = word })
			end, { desc = "Grep String" })

			vim.keymap.set("n", "<leader>vh", builtin.help_tags)

			vim.keymap.set("n", "<leader>pt", builtin.live_grep)

			require("telescope").load_extension("undo")

			vim.keymap.set("n", "<leader>p[", function()
				builtin.colorscheme()
			end)

			vim.keymap.set("n", "<leader><leader>", function()
				builtin.oldfiles()
			end)

			vim.keymap.set("n", "<leader>pr", function()
				builtin.quickfix()
			end)
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}

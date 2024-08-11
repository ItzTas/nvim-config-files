return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
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

			vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find Git Files" })
			vim.keymap.set("n", "<leader>pw", function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end)
			vim.keymap.set("n", "<leader>pW", function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end)

			vim.keymap.set("n", "<leader>ps", function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end, { desc = "Grep String" })
			vim.keymap.set("n", "<leader>vh", builtin.help_tags)
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			-- This is your opts table
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

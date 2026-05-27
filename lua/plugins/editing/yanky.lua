return {
	"gbprod/yanky.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	event = "BufReadPost",
	keys = {
		{
			"mv",
			function()
				local actions = require("telescope.actions")
				require("telescope").extensions.yank_history.yank_history({
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
				})
			end,
			desc = "Yank History",
		},
	},

	config = function()
		require("yanky").setup({
			ring = {
				history_length = 50,
				storage = "shada",
			},
			highlight = {
				on_put = true,
				on_yank = true,
				timer = 5,
			},
			picker = {
				select = {
					action = nil,
				},
				telescope = {
					use_default_mappings = true,
					mappings = nil,
				},
			},
		})

		require("telescope").load_extension("yank_history")

		vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
		vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
	end,
}

return {
	{
		"oxfist/night-owl.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("night-owl").setup()
		end,
		name = "night-owl",
	},
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		name = "zenbones",
	},
	{
		"adisen99/apprentice.nvim",
		dependencies = {
			"rktjmp/lush.nvim",
		},
		name = "apprentice",
	},
	{
		"EdenEast/nightfox.nvim",
		name = "nightfox",
	},
	{
		"whatyouhide/vim-gotham",
		name = "gotham",
	},
	{
		"loctvl842/monokai-pro.nvim",
		name = "monokai-pro",
	},
	{
		"marko-cerovac/material.nvim",
		name = "material",
	},
	{
		"Shatur/neovim-ayu",
		name = "ayu",
	},
	{
		"shaunsingh/nord.nvim",
		name = "nord",
	},
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		priority = 1000,
		config = true,
	},
	{
		"shaunsingh/solarized.nvim",
		name = "solarized",
		lazy = false,
		priority = 1000,
	},
	{
		"dracula/vim",
		name = "dracula",
		lazy = false,
		priority = 1000,
	},
	{
		"NLKNguyen/papercolor-theme",
		name = "PaperColor",
		lazy = false,
		priority = 1000,
	},
	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		lazy = false,
		priority = 1000,
	},
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "auto", -- auto, main, moon, or dawn
				dark_variant = "main", -- main, moon, or dawn
				dim_inactive_windows = false,
				extend_background_behind_borders = true,

				enable = {
					terminal = true,
					legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
					migrations = true, -- Handle deprecated options automatically
				},

				styles = {
					bold = true,
					italic = false,
					transparency = false,
				},

				groups = {
					border = "muted",
					link = "iris",
					panel = "surface",

					error = "love",
					hint = "iris",
					info = "foam",
					note = "pine",
					todo = "rose",
					warn = "gold",

					git_add = "foam",
					git_change = "rose",
					git_delete = "love",
					git_dirty = "rose",
					git_ignore = "muted",
					git_merge = "iris",
					git_rename = "pine",
					git_stage = "iris",
					git_text = "rose",
					git_untracked = "subtle",

					h1 = "iris",
					h2 = "foam",
					h3 = "rose",
					h4 = "gold",
					h5 = "pine",
					h6 = "foam",
				},

				highlight_groups = {
					-- Comment = { fg = "foam" },
					-- VertSplit = { fg = "muted", bg = "muted" },
				},

				before_highlight = function(group, highlight, palette)
					-- Disable all undercurls
					-- if highlight.undercurl then
					--     highlight.undercurl = false
					-- end
					--
					-- Change palette colour
					-- if highlight.fg == palette.pine then
					--     highlight.fg = palette.foam
					-- end
				end,
			})
		end,
	},
}

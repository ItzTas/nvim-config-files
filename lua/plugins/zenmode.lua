return -- Lua
{
	"folke/zen-mode.nvim",
	opts = {},
	config = function()
		vim.keymap.set("n", "<leader>Z", vim.cmd.ZenMode)
	end,
}

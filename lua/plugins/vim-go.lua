return {
	"fatih/vim-go",
	config = function()
		vim.keymap.set("n", "<leader>gj", function()
			vim.cmd("GoAddTags json")
		end)
	end,
}

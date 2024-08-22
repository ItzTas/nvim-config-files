return {
	"easymotion/vim-easymotion",
	config = function()
		vim.keymap.set("n", "<leader>q", "<Plug>(easymotion-overwin-f)", { noremap = true, silent = true })
	end,
}

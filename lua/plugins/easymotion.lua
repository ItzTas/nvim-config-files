return {
	"easymotion/vim-easymotion",
	config = function()
vim.keymap.set("n", "<C-s>", "<Plug>(easymotion-overwin-f)", { noremap = true, silent = true })
	end,
}

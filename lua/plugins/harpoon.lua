return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<C-f>", function()
			harpoon:list():select(1)
		end)

		vim.keymap.set("n", "<C-b>", function()
			harpoon:list():select(2)
		end)

		for i = 1, 9, 1 do
			vim.keymap.set("n", string.format("<leader>%d", i), function()
				harpoon:list():select(i)
			end)
		end
	end,
}

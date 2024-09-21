return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
		vim.keymap.set("n", "<leader>gd", vim.cmd.Gvdiffsplit)
		vim.keymap.set("n", "<leader>ggl", vim.cmd.GlLog, { desc = "GlLog" })

		vim.keymap.set("n", "<leader>cm", ":Git commit -m \"\"<left>")
		vim.keymap.set("n", "<leader>pu", function()
			vim.cmd("Git push")
		end)
		vim.keymap.set("n", "<leader>pl", function()
			vim.cmd("Git pull --rebase")
		end)

		vim.keymap.set("n", "<leader>gl", function()
			vim.cmd("Git log")
		end, { desc = "git log" })

		vim.keymap.set("n", "<leader>gra", function()
			vim.cmd('Git log --oneline --graph --all --decorate --stat --pretty=format:"%h %d %s %an %ar"')
		end, { desc = "git graph" })

		vim.keymap.set("n", "<leader>ge", function()
			vim.cmd("Git blame -f -n --show-stats --progress", { desc = "git blame" })
		end)
	end,
}

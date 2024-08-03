return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")

		vim.keymap.set("n", "<F12>", function()
			dap.step_out()
		end)

		vim.keymap.set("n", "<leader>dc", function()
			dap.continue()
		end)

		vim.keymap.set("n", "<Leader>dt", function()
			dap.toggle_breakpoint()
		end)

		vim.keymap.set("n", "<Leader>ds", function()
			dap.set_breakpoint()
		end)
	end,
}

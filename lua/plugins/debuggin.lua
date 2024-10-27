return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-plenary",
			"fredrikaverpil/neotest-golang",
			"mfussenegger/nvim-dap",
			"nvim-neotest/neotest-jest",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-plenary"),
					require("neotest-golang"),
					require("neotest-jest")({
						jestCommand = "npm test --",
						env = { CI = true },
						cwd = function(path)
							return vim.fn.getcwd()
						end,
						jestConfigFile = function(file)
							if string.find(file, "/packages/") then
								return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
							end

							return vim.fn.getcwd() .. "/jest.config.ts"
						end,
					}),
				},
			})

			vim.keymap.set("n", "<leader>dp", function()
				require("neotest").run.run({ jestCommand = "jest --watch " })
			end)

			vim.keymap.set("n", "<leader>dr", function()
				require("neotest").run.run()
			end)

			vim.keymap.set("n", "<leader>da", function()
				require("neotest").run.attach()
			end)

			vim.keymap.set("n", "<leader>dR", function()
				require("neotest").run.run(vim.fn.expand("%"))
			end)
		end,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			"leoluz/nvim-dap-go",
			"folke/lazydev.nvim",
		},
		config = function()
			local dap = require("dap")

			require("dap-go").setup({})

			local dapui = require("dapui")

			dapui.setup({})

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
			vim.keymap.set("n", "<F12>", function()
				dap.step_into()
			end)

			vim.keymap.set("n", "<leader>dc", function()
				dap.continue()
			end)

			vim.keymap.set("n", "<Leader>dt", function()
				dap.toggle_breakpoint()
			end)
		end,
	},
}

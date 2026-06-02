return {
	"coder/claudecode.nvim",
	cmd = {
		"ClaudeCode",
		"ClaudeCodeFocus",
		"ClaudeCodeSelectModel",
		"ClaudeCodeAdd",
		"ClaudeCodeSend",
		"ClaudeCodeTreeAdd",
		"ClaudeCodeDiffAccept",
		"ClaudeCodeDiffDeny",
	},
	opts = {
		terminal = {
			provider = "native",
			split_side = "right",
			split_width_percentage = 0.35,
			auto_close = true,
		},
	},
	keys = {
		{ "<leader>ic", "<cmd>ClaudeCode<cr>", desc = "Claude: toggle" },
		{ "<leader>if", "<cmd>ClaudeCodeFocus<cr>", desc = "Claude: focus" },
		{ "<leader>ir", "<cmd>ClaudeCode --resume<cr>", desc = "Claude: resume" },
		{ "<leader>iC", "<cmd>ClaudeCode --continue<cr>", desc = "Claude: continue" },
		{ "<leader>im", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Claude: select model" },
		{ "<leader>ib", "<cmd>ClaudeCodeAdd %<cr>", desc = "Claude: add current buffer" },
		{ "<leader>is", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Claude: send selection" },
		{
			"<leader>is",
			"<cmd>ClaudeCodeTreeAdd<cr>",
			desc = "Claude: add file",
			ft = { "oil" },
		},
		{ "<leader>ia", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Claude: accept diff" },
		{ "<leader>id", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Claude: deny diff" },
	},
}

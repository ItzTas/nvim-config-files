-- Diagnostics-only linters (none-ls is dormant in this config).
-- Kotlin: ktlint (style) + detekt (static analysis / code smells).
-- Binaries come from Mason: `:MasonInstall ktlint detekt`.
return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			kotlin = { "ktlint", "detekt" },
		}

		local group = vim.api.nvim_create_augroup("nvim-lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
			group = group,
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}

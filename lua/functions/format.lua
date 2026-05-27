local M = {}

function M.format_file(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	local ok, conform = pcall(require, "conform")
	if ok then
		conform.format({
			bufnr = bufnr,
			async = true,
			lsp_fallback = true,
		})
	else
		vim.lsp.buf.format({
			bufnr = bufnr,
			async = true,
		})
	end
end

return M

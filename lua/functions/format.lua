local M = {}

function M.format_file(bufnr)
    M.format_ignore_ts_ls(bufnr)
end

function M.format_ignore_ts_ls(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    vim.lsp.buf.format({
        async = false,
        timeout_ms = 10000,
        filter = function(client)
            return client.name ~= "ts_ls"
        end,
        bufnr = bufnr,
    })
end

_G.format_file = M.format_file

return M

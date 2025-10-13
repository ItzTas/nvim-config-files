local M = {}

function M.format_file(bufnr)
    M.format_js_ts(bufnr)
end

function M.format_js_ts(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()

    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    local has_other_formatter = false

    for _, client in ipairs(clients) do
        if client.supports_method("textDocument/formatting") and client.name ~= "ts_ls" then
            has_other_formatter = true
            break
        end
    end

    vim.lsp.buf.format({
        async = false,
        timeout_ms = 10000,
        filter = function(client)
            if has_other_formatter then
                return client.name ~= "ts_ls"
            else
                return true
            end
        end,
        bufnr = bufnr,
    })
end

_G.format_file = M.format_file

return M

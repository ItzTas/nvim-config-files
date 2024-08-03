function Format_and_save()
    vim.lsp.buf.format()
    vim.cmd("w")
end

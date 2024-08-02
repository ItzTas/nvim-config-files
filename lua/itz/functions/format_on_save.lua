function Format_and_save()
    -- Formatar o buffer atual
    vim.lsp.buf.format()
    -- Salvar o arquivo
    vim.cmd('write')
end

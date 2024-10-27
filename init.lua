vim.g.mapleader = " "
vim.opt.termguicolors = true
require("config.lazy")
require("itz")
require("itz.set")
require("itz.remaps")
vim.cmd("colorscheme nightfly")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "WildMenu", { bg = "none" })

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.*" },
    callback = function()
        require("gitsigns").toggle_current_line_blame()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        local clients = vim.lsp.buf_get_clients(0)
        if next(clients) ~= nil then
            for _, client in pairs(clients) do
                vim.lsp.buf_detach_client(0, client.id)
            end
        end
    end,
})

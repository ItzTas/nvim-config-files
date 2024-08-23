vim.g.mapleader = " "
require("config.lazy")
require("itz")
require("itz.set")
require("itz.remaps")
vim.cmd("colorscheme rose-pine")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.*" },
    callback = function()
        require("gitsigns").toggle_current_line_blame()
    end,
})

vim.api.nvim_create_augroup("formatting", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    group = "formatting",
    pattern = "*",
    callback = function()
        if vim.lsp.buf.format then
         vim.lsp.buf.format()
        end
    end,
})

return {
    "justinmk/vim-sneak",
    opts = {},
    config = function()
        vim.api.nvim_set_keymap('n', '<Leader>w', '<Plug>Sneak_s', { noremap = false, silent = true })
        vim.api.nvim_set_keymap('n', '<Leader>W', '<Plug>Sneak_S', { noremap = false, silent = true })
        vim.g['sneak#label'] = 1
    end
}

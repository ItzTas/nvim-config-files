return {
    "codota/tabnine-nvim",
    build = "./dl_binaries.sh",
    config = function()
        require("tabnine").setup({
            disable_auto_comment = true,
            accept_keymap = false,
            dismiss_keymap = "<C-]>",
            debounce_ms = 800,
            suggestion_color = { gui = "#808080", cterm = 244 },
            codelens_color = { gui = "#808080", cterm = 244 },
            codelens_enabled = true,
            exclude_filetypes = { "TelescopePrompt", "NvimTree" },
            log_file_path = nil,
            ignore_certificate_errors = false,
        })

        vim.keymap.set("n", "<leader>tc", require("tabnine.chat").open)

        vim.keymap.set("i", "<C-b>", function()
            if require("tabnine.keymaps").has_suggestion() then
                return require("tabnine.keymaps").accept_suggestion()
            elseif require("luasnip").jumpable(1) then
                return require("luasnip").jump(1)
            else
                return "<C-b>"
            end
        end, { expr = true })
    end,
}

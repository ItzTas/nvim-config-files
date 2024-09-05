return {
    "smoka7/hop.nvim",
    version = "*",
    opts = {
        keys = "etovxqpdygfblzhckisuran",
    },
    config = function()
        local hop = require("hop")
        hop.setup()

        vim.keymap.set("n", "<C-s>", function()
            hop.hint_char1({ current_line_only = false })
        end, { remap = true })
    end,
}

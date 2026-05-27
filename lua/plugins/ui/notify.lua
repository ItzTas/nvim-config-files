return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
        local notify = require("notify")
        notify.setup({
            stages = "fade",
            timeout = 3000,
            background_colour = "#000000",
            on_open = function(win)
                vim.api.nvim_win_set_option(win, "winblend", 100)
            end,
        })
        vim.notify = notify

        local function make_transparent()
            local levels = { "ERROR", "WARN", "INFO", "DEBUG", "TRACE" }
            for _, level in ipairs(levels) do
                vim.api.nvim_set_hl(0, "Notify" .. level .. "Body", { bg = "NONE" })
                vim.api.nvim_set_hl(0, "Notify" .. level .. "Border", { bg = "NONE" })
                vim.api.nvim_set_hl(0, "Notify" .. level .. "Title", { bg = "NONE" })
                vim.api.nvim_set_hl(0, "Notify" .. level .. "Icon", { bg = "NONE" })
            end
            vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "NONE" })
        end

        make_transparent()
        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "*",
            callback = make_transparent,
        })
    end,
}

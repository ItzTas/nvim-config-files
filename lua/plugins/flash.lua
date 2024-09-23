return {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {},
    config = function()
        require("flash").setup({
            labels = "asdfghjklqwertyuiopzxcvbnm",
            search = {
                multi_window = true,
                forward = true,
                wrap = true,
                mode = "exact",
                incremental = false,
                exclude = {
                    "notify",
                    "cmp_menu",
                    "noice",
                    "flash_prompt",
                    function(win)
                        return not vim.api.nvim_win_get_config(win).focusable
                    end,
                },
                trigger = "",
                max_length = false,
            },
            jump = {
                jumplist = true,
                pos = "start",
                history = false,
                register = false,
                nohlsearch = false,
                autojump = false,
                inclusive = nil,
                offset = nil,
            },
            label = {
                uppercase = true,
                exclude = "",
                current = true,
                after = true,
                before = false,
                style = "overlay",
                reuse = "lowercase",
                distance = true,
                min_pattern_length = 0,
                rainbow = {
                    enabled = false,
                    shade = 5,
                },
                format = function(opts)
                    return { { opts.match.label, opts.hl_group } }
                end,
            },
            highlight = {
                backdrop = true,
                matches = true,
                priority = 5000,
                groups = {
                    match = "FlashMatch",
                    current = "FlashCurrent",
                    backdrop = "FlashBackdrop",
                    label = "FlashLabel",
                },
            },
            action = nil,
            pattern = "",
            continue = false,
            config = nil,
            modes = {
                char = {
                    enabled = true,
                    autohide = false,
                    jump_labels = true,
                    multi_line = false,
                    label = { exclude = "hjkliardc" },
                    keys = { "f", "F", "t", "T", ";", "," },
                    char_actions = function(motion)
                        return {
                            [motion:lower()] = "next",
                            [motion:upper()] = "prev",
                        }
                    end,
                    search = { wrap = false },
                    highlight = { backdrop = true },
                    jump = {
                        register = false,
                        autojump = false,
                    },
                },
                -- Outras opções de modos se necessário...
            },
            prompt = {
                enabled = true,
                prefix = { { "⚡", "FlashPromptIcon" } },
                win_config = {
                    relative = "editor",
                    width = 1,
                    height = 1,
                    row = -1,
                    col = 0,
                    zindex = 1000,
                },
            },
            remote_op = {
                restore = false,
                motion = false,
            },
        })

        vim.keymap.set("n", "<leader>q", function()
            require("flash").jump({
                pattern = vim.fn.expand("<cword>"),
            })
        end)
    end,
}

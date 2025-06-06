return {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
        {
            "<leader>tr",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>tT",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        {
            "<leader>cs",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>cl",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
            "<leader>tL",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
        },
        {
            "<leader>tQ",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List (Trouble)",
        },
    },

    config = function()
        require("trouble").setup({
            auto_close = false,
            auto_open = false,
            auto_preview = true,
            auto_refresh = true,
            auto_jump = false,
            focus = false,
            restore = true,
            follow = true,
            indent_guides = true,
            max_items = 200,
            multiline = true,
            pinned = false,
            warn_no_results = true,
            open_no_results = false,
            win = {},
            preview = {
                type = "main",
                scratch = true,
            },
            throttle = {
                refresh = 20,
                update = 10,
                render = 10,
                follow = 100,
                preview = { ms = 100, debounce = true },
            },
            keys = {
                ["?"] = "help",
                r = "refresh",
                R = "toggle_refresh",
                q = "close",
                o = "jump_close",
                ["<esc>"] = "cancel",
                ["<cr>"] = "jump",
                ["<2-leftmouse>"] = "jump",
                ["<c-s>"] = "jump_split",
                ["<c-v>"] = "jump_vsplit",
                ["}"] = "next",
                ["]]"] = "next",

                ["{"] = "prev",
                ["[["] = "prev",
                dd = "delete",
                d = { action = "delete", mode = "v" },
                i = "inspect",
                p = "preview",
                P = "toggle_preview",
                zo = "fold_open",
                zO = "fold_open_recursive",
                zc = "fold_close",
                zC = "fold_close_recursive",
                za = "fold_toggle",
                zA = "fold_toggle_recursive",
                zm = "fold_more",
                zM = "fold_close_all",
                zr = "fold_reduce",
                zR = "fold_open_all",
                zx = "fold_update",
                zX = "fold_update_all",
                zn = "fold_disable",
                zN = "fold_enable",
                zi = "fold_toggle_enable",
                gb = {
                    action = function(view)
                        view:filter({ buf = 0 }, { toggle = true })
                    end,
                    desc = "Toggle Current Buffer Filter",
                },
                s = {
                    action = function(view)
                        local f = view:get_filter("severity")
                        local severity = ((f and f.filter.severity or 0) + 1) % 5
                        view:filter({ severity = severity }, {
                            id = "severity",
                            template = "{hl:Title}Filter:{hl} {severity}",
                            del = severity == 0,
                        })
                    end,
                    desc = "Toggle Severity Filter",
                },
            },
        })
    end,
}

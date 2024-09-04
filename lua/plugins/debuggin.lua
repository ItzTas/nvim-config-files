return {
    "mfussenegger/nvim-dap",
    dependencies = {
        { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neorequire/nvim-nio" } },
        "leoluz/nvim-dap-go",
    },
    config = function()
        local dap = require("dap")
        require("dap-go").setup({})
        local dapui = require("dapui")
        dapui.setup({})
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        vim.keymap.set("n", "<F12>", function()
            dap.step_out()
        end)

        vim.keymap.set("n", "<leader>dc", function()
            dap.continue()
        end)

        vim.keymap.set("n", "<Leader>dt", function()
            dap.toggle_breakpoint()
        end)

        vim.keymap.set("n", "<Leader>ds", function()
            dap.set_breakpoint()
        end)
    end,
}

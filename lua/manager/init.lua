local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

local function get_specs()
    local specs = {}
    local root = vim.fn.stdpath("config") .. "/lua/plugins"

    local files = vim.fn.globpath(root, "**/*.lua", true, true)

    for _, file in ipairs(files) do
        local rel = file:gsub(root .. "/", ""):gsub("%.lua$", ""):gsub("/", ".")
        table.insert(specs, { import = "plugins." .. rel })
    end

    return specs
end

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
    spec = get_specs(),

    install = { colorscheme = { "rose-pine", "zenbones" } },

    checker = { enabled = true, notify = false },

    change_detection = { notify = false },
})

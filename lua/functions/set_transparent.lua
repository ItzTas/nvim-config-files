local M = {}

function M.set_transparent_background()
    local transparent_groups = {
        "Normal",
        "NormalFloat",
        "NormalNc",
        "EndOfBuffer",
        "TelescopeNormal",
        "TelescopeBorder",
        "LineNr",
        "CursorLineNr",
        "VertSplit",
        "SignColumn",
        "WinSeparator",
        "Pmenu",
        "TabLine",
        "FoldColumn",
        "Folded",
        "FloatBorder",
        "WildMenu",
    }

    for _, group in ipairs(transparent_groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none", fg = "none" })
    end
end

_G.set_transparent_background = M.set_transparent_background

return M

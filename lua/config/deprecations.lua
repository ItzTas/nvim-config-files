-- Work around upstream deprecations we can't fix ourselves.

-- Shim: plugins still using the deprecated vim.tbl_flatten
-- (e.g. the telescope live-grep helper still calls the deprecated function).
---@diagnostic disable-next-line: duplicate-set-field
vim.tbl_flatten = function(t)
    return vim.iter(t):flatten():totable()
end

-- Silence specific upstream deprecation warnings we can't fix ourselves.
--
-- `typescript-tools.nvim` still calls `vim.lsp.codelens.refresh()`, deprecated
-- in Neovim 0.12 (removed in 0.13). We use `code_lens = "all"`, which wires up
-- the plugin autocmd that triggers it on every BufEnter/CursorHold. Filter only
-- that message so codelens keeps working until the plugin migrates.
local original_deprecate = vim.deprecate

---@diagnostic disable-next-line: duplicate-set-field
vim.deprecate = function(name, ...)
    if type(name) == "string" and name:find("codelens.refresh", 1, true) then
        return
    end
    return original_deprecate(name, ...)
end

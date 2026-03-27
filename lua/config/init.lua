local path = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
for _, file in ipairs(vim.fn.glob(path .. "*.lua", false, true)) do
    local module = file:match(".*/(.*)%.lua$")
    if module ~= "init" then
        require("config." .. module)
    end
end

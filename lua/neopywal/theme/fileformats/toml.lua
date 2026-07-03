local M = {}

---@return NeopywalAlias.basic_module.get
function M.get()
    return {
        tomlTable = { link = "Special" },
        tomlKey = { link = "Function" },
        tomlBoolean = { link = "Boolean" },
        tomlString = { link = "String" },
        tomlTableArray = { link = "tomlTable" },
    }
end

return M

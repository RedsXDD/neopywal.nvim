local M = {}

---@return NeopywalAlias.basic_module.get
function M.get()
    return {
        makeIdent = { link = "Variable" },
        makeSpecTarget = { link = "Special" },
        makeTarget = { link = "Function" },
        makeCommands = { link = "Identifier" },
    }
end

return M

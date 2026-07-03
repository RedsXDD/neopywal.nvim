local M = {}

---@return NeopywalAlias.basic_module.get
function M.get()
    return {
        dosiniHeader = { link = "Function" },
        dosiniLabel = { link = "Label" },
        dosiniValue = { link = "Float" },
        dosiniNumber = { link = "Number" },
    }
end

return M

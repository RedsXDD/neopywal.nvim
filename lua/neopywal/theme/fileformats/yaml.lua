local M = {}

---@return NeopywalAlias.basic_module.get
function M.get()
    return {
        yamlKey = { link = "Function" },
        yamlConstant = { link = "Constant" },
        yamlString = { link = "String" },
    }
end

return M

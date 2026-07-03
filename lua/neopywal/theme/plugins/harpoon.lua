local M = {}

---@return NeopywalAlias.basic_module.get
function M.get()
    return {
        HarpoonWindow = { link = "NormalFloat" },
        HarpoonBorder = { link = "FloatBorder" },
    }
end

return M

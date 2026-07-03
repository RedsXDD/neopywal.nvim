local M = {}

---@return NeopywalAlias.basic_module.get
function M.get()
    return {
        MiniNotifyBorder = { link = "FloatBorder" },
        MiniNotifyNormal = { link = "NormalFloat" },
        MiniNotifyTitle = { link = "FloatTitle" },
    }
end

return M

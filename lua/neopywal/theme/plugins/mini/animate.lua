local M = {}

---@return NeopywalAlias.basic_module.get
function M.get()
    return {
        MiniAnimateCursor = { styles = { "reverse", "nocombine" } },
        MiniAnimateNormalFloat = { link = "NormalFloat" },
    }
end

return M

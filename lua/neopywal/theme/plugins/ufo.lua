local M = {}

---@return NeopywalAlias.basic_module.get
function M.get()
    return {
        UfoFoldedBg = { link = "Folded" },
        UfoFoldedFg = { link = "Folded" },
        UfoFoldedEllipsis = { fg = C.comment },
    }
end

return M

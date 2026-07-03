local M = {}

---@return NeopywalAlias.basic_module.get
function M.get()
    return {
        MiniCursorword = { styles = O.plugins.mini.cursorword.style or {} },
        MiniCursorwordCurrent = { link = "MiniCursorword" },
    }
end

return M

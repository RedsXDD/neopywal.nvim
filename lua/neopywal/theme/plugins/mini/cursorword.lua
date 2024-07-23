local M = {}

function M.get()
    return {
        MiniCursorword = { styles = O.plugins.mini.cursorword.style or {} },
        MiniCursorwordCurrent = { link = "MiniCursorword" },
    }
end

return M

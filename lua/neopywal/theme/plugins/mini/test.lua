local M = {}

function M.get()
    return {
        MiniTestEmphasis = { styles = { "bold" } },
        MiniTestFail = { fg = C.error, styles = { "bold" } },
        MiniTestPass = { fg = C.ok, styles = { "bold" } },
    }
end

return M

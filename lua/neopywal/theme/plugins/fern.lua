local M = {}

function M.get()
    return {
        FernMarkedLine = { fg = C.warn, bold = true },
        FernMarkedText = { link = "FernMarkedLine" },
    }
end

return M

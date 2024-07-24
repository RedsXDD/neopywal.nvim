local M = {}

function M.get()
    return {
        ALEErrorSign = { fg = C.error },
        ALEWarningSign = { fg = C.warn },
    }
end

return M

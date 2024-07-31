local M = {}

function M.get()
    return {
        NotificationInfo = { fg = C.info },
        NotificationWarning = { fg = C.warn },
        NotificationError = { fg = C.error },
    }
end

return M

local M = {}

function M.get()
    return {
        DapBreakpoint = { fg = C.ok },
        DapBreakpointCondition = { fg = C.warn },
        DapBreakpointRejected = { fg = C.error },
        DapLogPoint = { fg = C.color4 },
        DapStopped = { fg = C.color5 },
        DapStoppedLine = { bg = C.warn }, -- Used for "Warning" diagnostic virtual text
    }
end

return M

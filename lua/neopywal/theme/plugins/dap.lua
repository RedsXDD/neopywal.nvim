local M = {}

---@return NeopywalAlias.basic_module.get
function M.get()
    return {
        DapBreakpoint = { fg = C.ok },
        DapBreakpointCondition = { fg = C.warn },
        DapBreakpointRejected = { fg = C.error },
        DapLogPoint = { fg = C.color4 },
        DapStopped = { fg = C.color5 },
        DapStoppedLine = { bg = U.blend(C.warn, C.background, 0.2) }, -- Used for "Warning" diagnostic virtual text
    }
end

return M

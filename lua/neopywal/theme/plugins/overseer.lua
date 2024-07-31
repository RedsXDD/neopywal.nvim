local M = {}

function M.get()
    return {
        OverseerDISPOSED = { fg = C.comment },
        OverseerPENDING = { fg = C.unnecessary },
        OverseerRUNNING = { fg = C.info },
        OverseerSUCCESS = { fg = C.ok },
        OverseerCANCELED = { fg = C.warn },
        OverseerFAILURE = { fg = C.error },
        OverseerComponent = { fg = U.blend(C.color1, C.color3, 0.5) },
        OverseerField = { fg = C.color2 },
        OverseerOutput = { fg = C.foreground },
        OverseerTask = { fg = C.color4 },
        OverseerTaskBorder = { fg = C.color6 },
    }
end

return M

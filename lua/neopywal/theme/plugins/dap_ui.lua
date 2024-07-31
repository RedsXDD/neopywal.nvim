local M = {}

function M.get()
    return {
        DapUIBreakpointsCurrentLine = { fg = C.color2, styles = { "bold" } },
        DapUIBreakpointsDisabledLine = { fg = C.unnecessary },
        DapUIBreakpointsInfo = { fg = C.color2 },
        DapUIBreakpointsPath = { fg = C.color4 },
        DapUIDecoration = { fg = C.color4 },
        DapUIFloatBorder = { link = "FloatBorder" },
        DapUILineNumber = { fg = C.color4 },
        DapUIModifiedValue = { fg = C.warn },
        DapUINormalNC = { link = "NormalNC" },
        DapUIPlayPause = { fg = C.color2 },
        DapUIPlayPauseNC = { fg = C.color2 },
        DapUIRestart = { fg = C.color2 },
        DapUIRestartNC = { fg = C.color2 },
        DapUIScope = { fg = C.color4 },
        DapUISource = { fg = C.color5 },
        DapUIStepBack = { fg = C.color4 },
        DapUIStepBackNC = { fg = C.color4 },
        DapUIStepInto = { fg = C.color4 },
        DapUIStepIntoNC = { fg = C.color4 },
        DapUIStepOut = { fg = C.color4 },
        DapUIStepOutNC = { fg = C.color4 },
        DapUIStepOver = { fg = C.color4 },
        DapUIStepOverNC = { fg = C.color4 },
        DapUIStop = { fg = C.error },
        DapUIStopNC = { fg = C.error },
        DapUIStoppedThread = { fg = C.color4 },
        DapUIThread = { fg = C.color2 },
        DapUIType = { fg = C.color5 },
        DapUIUnavailable = { fg = C.unnecessary },
        DapUIUnavailableNC = { fg = C.unnecessary },
        DapUIValue = { fg = C.color4 },
        DapUIVariable = { fg = C.foreground },
        DapUIWatchesEmpty = { fg = C.warn },
        DapUIWatchesError = { fg = C.error },
        DapUIWatchesValue = { fg = C.color2 },
        DapUIWinSelect = { fg = C.color4, styles = { "bold" } },
    }
end

return M

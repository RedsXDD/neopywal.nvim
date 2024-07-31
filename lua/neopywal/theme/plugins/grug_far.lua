local M = {}

function M.get()
    return {
        GrugFarResultsMatch = { link = "DiffChange" },
        GrugFarResultsChangeIndicator = { fg = C.diff_changed },
        GrugFarResultsMatchRemoved = { link = "DiffDelete" },
        GrugFarResultsRemoveIndicator = { fg = C.diff_removed },
        GrugFarResultsMatchAdded = { link = "DiffAdd" },
        GrugFarResultsAddIndicator = { fg = C.diff_added },
        GrugFarResultsPath = { link = "Directory" },
        GrugFarResultsCmdHeader = { link = "URLlink" },
        GrugFarInputLabel = { fg = C.color4, styles = { "bold", "italic" } },
        GrugFarHelpHeader = { fg = C.color6, styles = { "bold", "italic" } },
        GrugFarHelpHeaderKey = { fg = C.color2, styles = { "bold", "italic" } },
        GrugFarHelpWinActionPrefix = { fg = C.warn, styles = { "bold", "italic" } },
        GrugFarHelpWinActionText = { link = "GrugFarHelpWinActionPrefix" },
        GrugFarHelpWinActionKey = { link = "Comment" },
    }
end

return M

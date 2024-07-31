local M = {}

function M.get()
    return {
        NotifierTitle = { fg = C.color4, styles = { "bold", "italic" } },
        NotifierIcon = { fg = C.color4, styles = { "bold", "italic" } },
        NotifierContent = { fg = C.foreground, blend = 0, styles = { "bold", "italic" } },
        NotifierContentDim = { fg = C.color8, blend = 0, styles = { "bold", "italic" } },
    }
end

return M

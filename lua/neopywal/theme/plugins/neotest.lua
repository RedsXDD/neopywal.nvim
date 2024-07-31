local M = {}

function M.get()
    return {
        NeotestAdapterName = { fg = C.color5 },
        NeotestDir = { link = "Directory" },
        NeotestExpandMarker = { fg = C.color8 },
        NeotestFailed = { fg = C.error },
        NeotestFile = { fg = C.color4 }, --  Links to "@text.uri" => "URLlink".
        NeotestFocused = { styles = { "bold", "underline" } },
        NeotestIndent = { fg = C.color8 },
        NeotestMarked = { fg = C.warn, styles = { "bold" } },
        NeotestNamespace = { fg = C.include }, --  Links to "@namespace" => "Include".
        NeotestPassed = { fg = C.ok },
        NeotestRunning = { fg = C.color3 },
        NeotestSkipped = { fg = C.color4 },
        NeotestTarget = { fg = C.color1 },
        NeotestTest = { fg = C.foreground },
        NeotestUnknown = { fg = C.unnecessary },
        NeotestWinSelect = { fg = C.color4, styles = { "bold" } },
    }
end

return M

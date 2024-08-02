local M = {}

function M.get()
    return {
        LazyProgressDone = { fg = C.variable },
        LazySpecial = { fg = C.specialchar },
        LazyDir = { link = "Directory" },
        LazyValue = { fg = C.string },
        LazyUrl = { link = "URLlink" },
        LazyDimmed = { link = (O.dim_inactive and "NormalNC" or "Conceal") },
        LazyCommit = { fg = C.identifier },
        LazyH1 = { bg = U.blend(C.background, C.foreground, 0.7), styles = { "bold" } }, -- Non-selected buttons.
        LazyH2 = { styles = { "bold" } },
        LazyButton = { bg = U.blend(C.background, C.foreground, 0.9), styles = { "bold" } }, -- Selected buttons.
        LazyReasonRuntime = { fg = C.macro },
        LazyReasonRequire = { fg = C.include },
        LazyButtonActive = { link = "LazyH1" },
        LazyReasonStart = { fg = C.color2 },
    }
end

return M

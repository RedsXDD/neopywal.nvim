local M = {}

function M.get()
    local bg = C.cursorline
    return {
        ScrollbarError = { fg = C.error },
        ScrollbarErrorHandle = { bg = bg, fg = C.error },
        ScrollbarHandle = { bg = bg, fg = C.none },
        ScrollbarHint = { fg = C.hint },
        ScrollbarHintHandle = { bg = bg, fg = C.hint },
        ScrollbarInfo = { fg = C.info },
        ScrollbarInfoHandle = { bg = bg, fg = C.info },
        ScrollbarMisc = { fg = C.color5 },
        ScrollbarMiscHandle = { bg = bg, fg = C.color5 },
        ScrollbarSearch = { fg = U.blend(C.color1, C.color3, 0.5) },
        ScrollbarSearchHandle = { bg = bg, fg = U.blend(C.color1, C.color3, 0.5) },
        ScrollbarWarn = { fg = C.warn },
        ScrollbarWarnHandle = { bg = bg, fg = C.warn },
    }
end

return M

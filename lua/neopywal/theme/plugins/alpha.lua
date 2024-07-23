local M = {}

function M.get()
    return {
        AlphaShortcut = { fg = U.blend(C.color1, C.color3, 0.5) },
        AlphaHeader = { fg = C.color4 },
        AlphaFooter = { fg = C.color5 },
        AlphaButtons = { fg = C.color6 },
    }
end

return M

local M = {}

function M.get()
    return {
        GlyphPalette1 = { fg = C.color1 },
        GlyphPalette2 = { fg = C.color2 },
        GlyphPalette3 = { fg = C.color3 },
        GlyphPalette4 = { fg = C.color4 },
        GlyphPalette6 = { fg = C.color6 },
        GlyphPalette7 = { fg = C.foreground },
        GlyphPalette8 = { fg = C.color8 },
        GlyphPalette9 = { fg = U.blend(C.color1, C.color3, 0.8) },
    }
end

return M

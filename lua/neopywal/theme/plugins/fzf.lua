local M = {}

function M.get()
    return {
        FzfLuaNormal = { link = "NormalFloat" },
        FzfLuaBorder = { link = "FloatBorder" },
        FzfLuaTitle = { link = "FloatTitle" },
        FzfLuaHeaderBind = { fg = C.color3 },
        FzfLuaHeaderText = { fg = U.blend(C.color1, C.color3, 0.5) },
        FzfLuaPathColNr = { fg = C.color4 },
        FzfLuaPathLineNr = { fg = C.color2 },
        FzfLuaBufName = { fg = U.blend(C.color5, C.foreground, 0.8) },
        FzfLuaBufNr = { fg = C.color3 },
        FzfLuaBufFlagCur = { fg = U.blend(C.color1, C.color3, 0.5) },
        FzfLuaBufFlagAlt = { fg = C.color4 },
        FzfLuaTabTitle = { fg = C.color6, bold = true },
        FzfLuaTabMarker = { fg = C.color3, bold = true },
        FzfLuaLiveSym = { fg = U.blend(C.color1, C.color3, 0.5) },
    }
end

return M

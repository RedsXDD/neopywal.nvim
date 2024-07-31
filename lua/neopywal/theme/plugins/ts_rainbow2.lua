local M = {}

function M.get()
    return {
        TSRainbowRed = { fg = C.color1 },
        TSRainbowYellow = { fg = C.color3 },
        TSRainbowBlue = { fg = C.color4 },
        TSRainbowOrange = { fg = U.blend(C.color1, C.color3, 0.5) },
        TSRainbowGreen = { fg = C.color2 },
        TSRainbowViolet = { fg = C.color5 },
        TSRainbowCyan = { fg = C.color6 },
    }
end

return M

local M = {}

function M.get()
    return {
        RainbowDelimiterRed = { fg = C.color1 },
        RainbowDelimiterYellow = { fg = C.color3 },
        RainbowDelimiterBlue = { fg = C.color4 },
        RainbowDelimiterOrange = { fg = U.blend(C.color1, C.color3, 0.5) },
        RainbowDelimiterGreen = { fg = C.color2 },
        RainbowDelimiterViolet = { fg = C.color5 },
        RainbowDelimiterCyan = { fg = C.color6 },
    }
end

return M

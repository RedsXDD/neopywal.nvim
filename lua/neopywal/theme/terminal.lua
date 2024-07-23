local M = {}

function M.get()
    return {
        terminal_color_0 = C.color0,
        terminal_color_1 = C.color1,
        terminal_color_2 = C.color2,
        terminal_color_3 = C.color3,
        terminal_color_4 = C.color4,
        terminal_color_5 = C.color5,
        terminal_color_6 = C.color6,
        terminal_color_7 = C.color7,
        terminal_color_8 = C.color8,
        terminal_color_9 = C.color9,
        terminal_color_10 = C.color10,
        terminal_color_11 = U.blend(C.color1, C.color3, 0.5),
        terminal_color_12 = C.color12,
        terminal_color_13 = C.color13,
        terminal_color_14 = C.color14,
        terminal_color_15 = C.color15,
    }
end

return M

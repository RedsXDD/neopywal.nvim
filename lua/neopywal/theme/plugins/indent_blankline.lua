local M = {}

function M.get()
    local scope_color = O.plugins.indent_blankline.scope_color
    if type(scope_color) == "function" then scope_color = scope_color(C) end
    scope_color = require("neopywal.utils.color").validate(scope_color, C.comment)

    local highlights = {
        IblIndent = { fg = scope_color },
        IblScope = { link = "IblIndent" },
    }

    if O.plugins.indent_blankline.colored_indent_levels then
        highlights["RainbowRed"] = { fg = C.color1, blend = 0 }
        highlights["RainbowYellow"] = { fg = C.color3, blend = 0 }
        highlights["RainbowBlue"] = { fg = C.color4, blend = 0 }
        highlights["RainbowOrange"] = { fg = U.blend(C.color1, C.color3, 0.5), blend = 0 }
        highlights["RainbowGreen"] = { fg = C.color2, blend = 0 }
        highlights["RainbowViolet"] = { fg = C.color5, blend = 0 }
        highlights["RainbowCyan"] = { fg = C.color6, blend = 0 }
    end

    return highlights
end

return M

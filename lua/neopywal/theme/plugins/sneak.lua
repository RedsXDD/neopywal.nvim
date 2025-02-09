local M = {}

function M.get()
    local sneak_color = O.plugins.sneak.sneak_color
    if type(sneak_color) == "function" then sneak_color = sneak_color(C) end
    sneak_color = require("neopywal.utils.color").validate(sneak_color, C.color5)

    return {
        Sneak = { bg = sneak_color, fg = C.background, styles = O.plugins.sneak.style or {} },
        SneakScope = { bg = U.blend(sneak_color, C.background, 0.2), styles = O.plugins.sneak.style or {} },
        SneakLabel = { bg = sneak_color, fg = C.background, styles = O.plugins.sneak.style or {} },
        SneakLabelMast = { bg = sneak_color, fg = sneak_color },
    }
end

return M

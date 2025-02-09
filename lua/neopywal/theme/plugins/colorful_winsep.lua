local M = {}

function M.get()
    local winsep_color = O.plugins.colorful_winsep.color
    if type(winsep_color) == "function" then winsep_color = winsep_color(C) end
    winsep_color = require("neopywal.utils.color").validate(winsep_color, C.color4)

    return {
        NvimSeparator = {
            bg = O.transparent_background and C.none or O.dim_inactive and C.dim_bg or C.background,
            fg = winsep_color,
        },
    }
end

return M

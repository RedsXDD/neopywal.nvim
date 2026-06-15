local M = {}

function M.get()
    local color_opts = O.plugins.mini.trailspace.color
    if type(color_opts) == "table" then
        local bg = color_opts.bg
        if type(bg) == "function" then bg = bg(C) end
        bg = require("neopywal.utils.color").validate(bg, C.warn)

        local fg = color_opts.fg
        if type(fg) == "function" then fg = fg(C) end
        fg = require("neopywal.utils.color").validate(fg, C.warn)

        return {
            MiniTrailspace = {
                bg = bg,
                fg = fg,
                styles = O.plugins.mini.trailspace.style or {},
            },
        }
    end

    if color_opts ~= nil and type(color_opts) == "string" then
        local color = color_opts
        if type(color) == "function" then color = color(C) end
        color = require("neopywal.utils.color").validate(color, C.warn)

        return {
            MiniTrailspace = {
                bg = color,
                styles = O.plugins.mini.trailspace.style or {},
            },
        }
    end
end

return M

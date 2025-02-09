local M = {}

function M.get()
    local trailspace_color = O.plugins.mini.trailspace.color
    if type(trailspace_color) == "function" then trailspace_color = trailspace_color(C) end
    trailspace_color = require("neopywal.utils.color").validate(trailspace_color, C.warn)

    return {
        MiniTrailspace = { bg = trailspace_color },
    }
end

return M

local M = {}

function M.get()
    local C = require("neopywal.lib.palette").get()
    local U = require("neopywal.utils.color")

    return {
        C.color1,
        U.blend(C.color1, C.color3, 0.5),
        C.color3,
        C.color2,
        C.color6,
        C.color4,
        C.color5,
    }
end

return M

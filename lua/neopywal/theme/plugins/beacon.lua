local M = {}

function M.get()
    local beacon_color = O.plugins.beacon.color
    if type(beacon_color) == "function" then beacon_color = beacon_color(C) end
    beacon_color = require("neopywal.utils.hex").validate(beacon_color, C.color4)

    return {
        Beacon = { bg = beacon_color },
    }
end

return M

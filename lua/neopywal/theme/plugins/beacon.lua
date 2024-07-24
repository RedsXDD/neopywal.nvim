local M = {}

function M.get()
    local hex_chars = "[abcdef0-9][abcdef0-9]"
    local pattern = "^#(" .. hex_chars .. ")(" .. hex_chars .. ")(" .. hex_chars .. ")$"

    local beacon_color = O.plugins.beacon.color
    beacon_color = beacon_color ~= "" and beacon_color or C.color4
    beacon_color = string.lower(beacon_color)
    beacon_color = string.find(beacon_color, pattern) ~= nil and beacon_color
        or C[beacon_color] ~= nil and C[beacon_color]
        or C.color4

    return {
        Beacon = { bg = beacon_color },
    }
end

return M

local M = {}

function M.get()
    local hex_chars = "[abcdef0-9][abcdef0-9]"
    local pattern = "^#(" .. hex_chars .. ")(" .. hex_chars .. ")(" .. hex_chars .. ")$"

    local trailspace_color = O.plugins.mini.trailspace.color
    if type(trailspace_color) == "function" then trailspace_color = trailspace_color(C) end

    trailspace_color = trailspace_color ~= "" and trailspace_color or C.warn
    trailspace_color = string.lower(trailspace_color)
    trailspace_color = string.find(trailspace_color, pattern) ~= nil and trailspace_color
        or C[trailspace_color] ~= nil and C[trailspace_color]
        or C.warn

    return {
        MiniTrailspace = { bg = trailspace_color },
    }
end

return M

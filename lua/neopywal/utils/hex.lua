local M = {}

---@param hex_color string? The color you want to validate as a valid hexadecimal color.
---@param fallback_color string? A fallback color in case the first parameter color turns out to be invalid.
function M.validate(hex_color, fallback_color)
    hex_color = hex_color or ""
    fallback_color = fallback_color or ""

    local hex_chars = "[abcdef0-9][abcdef0-9]"
    local pattern = "^#(" .. hex_chars .. ")(" .. hex_chars .. ")(" .. hex_chars .. ")$"

    hex_color = hex_color ~= "" and hex_color or fallback_color
    hex_color = string.lower(hex_color)
    hex_color = string.find(hex_color, pattern) ~= nil and hex_color
        or C[hex_color] ~= nil and C[hex_color]
        or fallback_color

    return hex_color
end

return M

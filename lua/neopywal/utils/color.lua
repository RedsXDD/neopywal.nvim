local M = {}

local function ensureColor(color)
    local result = color

    -- Ensure the blended value is not less than 0.
    -- This prevents the color from being too dark.
    result = math.max(0, result)

    -- Ensure the blended value is not more than 255.
    -- This prevents the color from being too bright.
    result = math.min(result, 255)

    -- Round the blended value to the nearest integer.
    -- This ensures the color value is a whole number.
    result = math.floor(result + 0.5)

    return result
end

---@param hex_color string? The color you want to validate as a valid hexadecimal color.
---@param fallback_color string? A fallback color in case the first parameter color turns out to be invalid.
function M.validate(hex_color, fallback_color)
    local C = require("neopywal.lib.palette").get()

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

function M.hexToRgb(hex_color)
    local hex_chars = "[abcdef0-9][abcdef0-9]"
    local pattern = "^#(" .. hex_chars .. ")(" .. hex_chars .. ")(" .. hex_chars .. ")$"
    hex_color = string.lower(hex_color)

    assert(string.find(hex_color, pattern) ~= nil, "hex_to_rgb: invalid hex_str: " .. tostring(hex_color))

    local r, g, b = string.match(hex_color, pattern)
    return {
        tonumber(r, 16),
        tonumber(g, 16),
        tonumber(b, 16),
    }
end

function M.blend(color1, color2, factor)
    -- Convert factor to a number if it's a hex string. Making sure it's betwheen 0 and 1.
    factor = type(factor) == "string" and math.abs((tonumber(factor, 16) / 0xff)) or math.abs(factor)

    -- Convert hex colors to RGB.
    local rgb_color1 = M.hexToRgb(color1)
    local rgb_color2 = M.hexToRgb(color2)

    -- Function to blend a single color channel.
    local blendChannel = function(i)
        local result = (factor * rgb_color1[i] + ((1 - factor) * rgb_color2[i]))
        return ensureColor(result)
    end

    -- Convert the blended RGB color back to hexadecimal and return it.
    return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

function M.darken(color, factor)
    factor = math.abs(factor)
    local rgb_color = M.hexToRgb(color)

    -- Function to subtract the factor from each component of the RGB color.
    local blendChannel = function(index)
        local blend = (rgb_color[index] - factor)
        return ensureColor(blend)
    end

    -- Convert the darkened RGB color back to hexadecimal and return it.
    return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

function M.lighten(color, factor)
    factor = math.abs(factor)
    local rgb_color = M.hexToRgb(color)

    -- Function to add the factor from each component of the RGB color.
    local blendChannel = function(index)
        local blend = (rgb_color[index] + factor)
        return ensureColor(blend)
    end

    -- Convert the lightened RGB color back to hexadecimal and return it.
    return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

return M

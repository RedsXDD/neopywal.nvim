local M = {}

local day_brightness = 0.3
local hsluv = require("neopywal.utils.hsluv")

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

function M.RgbToHex(rgb)
    local hexadecimal = "#"

    for _, value in pairs(rgb) do
        local hex = ""

        while value > 0 do
            local index = math.fmod(value, 16) + 1
            value = math.floor(value / 16)
            hex = string.sub(hsluv.hexChars, index, index) .. hex
        end

        if string.len(hex) == 0 then
            hex = "00"
        elseif string.len(hex) == 1 then
            hex = "0" .. hex
        end

        hexadecimal = hexadecimal .. hex
    end

    return hexadecimal
end

function M.blend(color1, color2, percentage)
    -- Convert factor to a number if it's a hex string. Making sure it's betwheen 0 and 1.
    percentage = type(percentage) == "string" and math.abs((tonumber(percentage, 16) / 0xff)) or math.abs(percentage)

    -- Convert hex colors to RGB.
    local rgb_color1 = M.hexToRgb(color1)
    local rgb_color2 = M.hexToRgb(color2)

    -- Function to blend a single color channel.
    local blendChannel = function(i)
        local result = (percentage * rgb_color1[i] + ((1 - percentage) * rgb_color2[i]))
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

function M.blacken(color, percentage)
    local hsl = hsluv.hex_to_hsluv(color)
    local larpSpace = hsl[3]
    if percentage < 0 then larpSpace = 1000 - hsl[3] end
    hsl[3] = hsl[3] - larpSpace * percentage
    return hsluv.hsluv_to_hex(hsl)
end

function M.brighten(color, percentage)
    local hsl = hsluv.hex_to_hsluv(color)
    local larpSpace = 100 - hsl[3]
    if percentage < 0 then larpSpace = hsl[3] end
    hsl[3] = hsl[3] + larpSpace * percentage
    return hsluv.hsluv_to_hex(hsl)
end

function M.saturate(color, percentage)
    local rgb = M.hexToRgb(color)

    local saturation_float = percentage

    table.sort(rgb)
    local rgb_intensity = {
        min = rgb[1] / 255,
        mid = rgb[2] / 255,
        max = rgb[3] / 255,
    }

    if rgb_intensity.max == rgb_intensity.min then
        -- all colors have same intensity, which means
        -- the original color is gray, so we can't change saturation.
        return color
    end

    local new_intensities = {}
    new_intensities.max = rgb_intensity.max
    new_intensities.min = rgb_intensity.max * (1 - saturation_float)

    if rgb_intensity.mid == rgb_intensity.min then
        new_intensities.mid = new_intensities.min
    else
        local intensity_proportion = (rgb_intensity.max - rgb_intensity.mid) / (rgb_intensity.mid - rgb_intensity.min)
        new_intensities.mid = (intensity_proportion * new_intensities.min + rgb_intensity.max)
            / (intensity_proportion + 1)
    end

    for i, v in pairs(new_intensities) do
        new_intensities[i] = math.floor(v * 255)
    end
    table.sort(new_intensities)
    return (M.RgbToHex({ new_intensities.max, new_intensities.min, new_intensities.mid }))
end

function M.invert(color)
    if color ~= "NONE" then
        local hsl = hsluv.hex_to_hsluv(color)
        hsl[3] = 100 - hsl[3]
        if hsl[3] < 40 then hsl[3] = hsl[3] + (100 - hsl[3]) * day_brightness end
        return hsluv.hsluv_to_hex(hsl)
    end
    return color
end

return M

local M = {}
local U = require("neopywal.utils.color")
local hsluv = require("neopywal.utils.hsluv")

---@return string
function M.saturate_hsl(color, percentage)
    local hsl = hsluv.hex_to_hsluv(color)
    hsl[2] = hsl[2] * (1 + percentage) % 100
    return hsluv.hsluv_to_hex(hsl)
end

---@return boolean
function M.bg_iswhite(bg)
    local hsl = hsluv.hex_to_hsluv(U.invert(bg))
    local bg_lightness = hsl[3]
    return bg_lightness < 50
end

---@return string
function M.setup_green(color)
    color = U.invert(color)
    color = U.brighten(color, 0.4)
    color = U.blacken(color, 0.2)
    return color
end

---@return string
function M.setup_yellow(color)
    color = M.saturate_hsl(color, 0.1)
    color = U.blacken(color, 0.13)
    color = M.saturate_hsl(color, -0.1)
    return color
end

---@return NeopywalMinimalPalette
---@param dark_theme NeopywalMinimalPalette
function M.convert_dark2light_theme(dark_theme)
    local dark = dark_theme
    local palette = {
        background = U.invert(dark.background),
        foreground = U.invert(dark.foreground),
        color0 = U.invert(dark.color0),
        color1 = U.invert(dark.color1),
        color4 = U.invert(dark.color4),
        color5 = U.invert(dark.color5),
        color6 = U.invert(dark.color6),
        color7 = U.invert(dark.color7),
        color8 = U.invert(dark.foreground),
        color9 = U.invert(dark.color9),
        color12 = U.invert(dark.color12),
        color13 = U.invert(dark.color13),
        color14 = U.invert(dark.color14),
        color15 = U.invert(dark.color15),

        -- Fix certain colors.
        color3 = M.setup_yellow(U.blend(dark.color1, dark.color3, 0.5)),
        color11 = M.setup_yellow(U.blend(dark.color9, dark.color11, 0.5)),
        color2 = M.setup_green(dark.color2),
        color10 = M.setup_green(dark.color10),
    }

    -- Improve the color's readability
    for i = 0, 15 do
        local darken_f = 15
        local lighten_f = 50
        local is_white = M.bg_iswhite(palette.background)
        palette["color" .. i] = is_white and U.darken(palette["color" .. i], darken_f)
            or U.lighten(palette["color" .. i], lighten_f)
    end

    return palette
end

return M

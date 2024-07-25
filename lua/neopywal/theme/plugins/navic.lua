local M = {}

function M.get()
    local hex_chars = "[abcdef0-9][abcdef0-9]"
    local pattern = "^#(" .. hex_chars .. ")(" .. hex_chars .. ")(" .. hex_chars .. ")$"

    local text_color = O.plugins.navic.dim_text and C.color8 or C.foreground
    local fallback_bg = O.transparent_background and C.none or C.background
    local bg_color = O.plugins.navic.bg_color
    if type(bg_color) == "function" then bg_color = bg_color(C) end

    bg_color = bg_color ~= "" and bg_color or fallback_bg
    bg_color = string.lower(bg_color)
    bg_color = string.find(bg_color, pattern) ~= nil and bg_color or C[bg_color] ~= nil and C[bg_color] or fallback_bg

    local kinds = require("neopywal.utils.kinds").get("NavicIcons%s", { bg = bg_color })
    return vim.tbl_deep_extend("force", kinds, {
        NavicText = { bg = bg_color, fg = text_color, styles = O.plugins.navic.text_style or {} },
        NavicSeparator = {
            bg = bg_color,
            fg = O.plugins.navic.hide_separator and bg_color or text_color,
        },
    })
end

return M

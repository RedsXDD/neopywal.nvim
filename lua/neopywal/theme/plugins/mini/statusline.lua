local M = {}

function M.get()
    local mode_colors = O.plugins.mini.statusline.mode_colors
    local default_mode_colors = require("neopywal").default_options.plugins.mini.statusline.mode_colors

    local hex_chars = "[abcdef0-9][abcdef0-9]"
    local pattern = "^#(" .. hex_chars .. ")(" .. hex_chars .. ")(" .. hex_chars .. ")$"
    for option in pairs(mode_colors) do
        local default_color = C[default_mode_colors[option]]

        local final_color = mode_colors[option]
        if type(final_color) == "function" then final_color = final_color(C) end

        final_color = final_color ~= "" and final_color or default_color
        final_color = string.lower(final_color)
        final_color = string.find(final_color, pattern) ~= nil and final_color
            or C[final_color] ~= nil and C[final_color]
            or default_color

        mode_colors[option] = final_color
    end

    return {
        MiniStatuslineModeNormal = { bg = mode_colors.normal, fg = C.background, styles = { "bold" } },
        MiniStatuslineModeVisual = { bg = mode_colors.visual, fg = C.background, styles = { "bold" } },
        MiniStatuslineModeInsert = { bg = mode_colors.insert, fg = C.background, styles = { "bold" } },
        MiniStatuslineModeCommand = { bg = mode_colors.command, fg = C.background, styles = { "bold" } },
        MiniStatuslineModeReplace = { bg = mode_colors.replace, fg = C.background, styles = { "bold" } },
        MiniStatuslineModeOther = { bg = mode_colors.other, fg = C.background, styles = { "bold" } },
        MiniStatuslineModeDevInfo = { link = "StatusLine" },
        MiniStatuslineModeFilename = { link = "StatusLineNC" },
        MiniStatuslineModeFileInfo = { link = "StatusLineNC" },
        MiniStatuslineModeInactive = { link = "StatusLineNC" },
    }
end

return M

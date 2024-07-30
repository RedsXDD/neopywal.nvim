-- vim:fileencoding=utf-8:foldmethod=marker
-- Reference: see `:h bufferline-highlights`

local M = {}
local O = require("neopywal.lib.config").options
local U = require("neopywal.utils.color")
local C = require("neopywal.lib.palette").get_colors()

local fill_bg = O.transparent_background and C.background or U.darken(C.dim_bg, 4)
local unselected_bg = O.transparent_background and C.none or C.dim_bg
local selected_bg = O.transparent_background and C.none or C.background

local default_highlights = {
    -- Filler background color of tabline.
    fill = { bg = fill_bg },

    -- Separators.
    separator = { bg = unselected_bg, fg = fill_bg }, -- Separator for non-selected buffers.
    separator_visible = { bg = unselected_bg, fg = fill_bg }, -- Separator for selected buffer on non-current windows.
    separator_selected = { bg = selected_bg, fg = fill_bg }, -- Separator for selected buffer.
    tab_separator = { bg = unselected_bg, fg = fill_bg }, -- Separator for non-selected tabs.
    tab_separator_selected = { bg = selected_bg, fg = fill_bg }, -- Separator for selected tab.
    -- offset_separator = {}, -- Offset separator for buffers.

    -- Modified icon.
    modified = { bg = unselected_bg, fg = C.color8 }, -- Icon color for non-selected modified buffers.
    modified_visible = { bg = unselected_bg, fg = C.color8 }, -- Icon color for selected modified buffer on non-current windows.
    modified_selected = {
        bg = selected_bg,
        fg = C.warn,
    }, -- Icon color for selected modified buffer.

    -- String that's duplicated from two buffers.
    duplicate = { bg = unselected_bg, fg = C.color8 }, -- String from a non-selected buffer that's duplicated.
    duplicate_visible = { bg = unselected_bg, fg = C.color8 }, -- String from a non-current buffer that's duplicated.
    -- duplicate_selected = {}, -- String of a selected buffer that's duplicated.

    -- BufferLinePick command.
    pick = { bg = unselected_bg, fg = C.color6, styles = { "bold", "italic" } }, -- Pick selector for non-selected buffers.
    pick_visible = { bg = unselected_bg, fg = C.color6, styles = { "bold", "italic" } }, -- Pick selector for selected buffer on non-current windows.
    pick_selected = { bg = C.background, fg = C.color6, styles = { "bold", "italic" } }, -- Pick selector for selected buffer.

    -- Truncation marker.
    trunc_marker = { bg = fill_bg, fg = C.color8 },

    -- Close button.
    close_button = { bg = unselected_bg, fg = C.color8 }, -- Close button non-selected buffers.
    close_button_visible = { bg = unselected_bg, fg = C.color8 }, -- Close button for selected buffer on non-current windows.
    close_button_selected = { fg = C.color1 }, -- Close button for selected buffer.
    tab_close = { bg = C.color1, fg = C.background }, -- Tab close button.

    -- Numbers.
    numbers = { bg = unselected_bg, fg = C.color8 }, -- Numbers for non-selected buffers.
    numbers_visible = { bg = unselected_bg, fg = C.color8 }, -- Numbers for selected buffer on non-current windows.
    -- numbers_selected = {}, -- Numbers for selected buffer.

    -- Buffers.
    background = { bg = unselected_bg, fg = C.color8 }, -- Non-selected buffers.
    buffer_visible = { bg = unselected_bg, fg = C.color8 }, -- Non-current buffers windows.
    -- buffer_selected = {}, -- Selected buffer.

    -- Tabs.
    tab = { bg = unselected_bg, fg = U.blend(C.background, C.foreground, 0.5) }, -- Text for non-selected tabs.
    tab_selected = { bg = selected_bg, fg = C.foreground, styles = { "bold", "italic" } }, -- Text on selected tab.

    -- Indicator.
    indicator_visible = { bg = unselected_bg, fg = C.color8 },
    indicator_selected = { fg = C.color4 },

    -- Diagnostics.
    diagnostic = { bg = unselected_bg, fg = C.color8 },
    diagnostic_visible = { bg = unselected_bg, fg = C.color8 },
    -- diagnostic_selected = {},

    -- Buffer with errors.
    error = { bg = unselected_bg, fg = C.color8 }, -- Non-selected buffers with errors.
    error_visible = { bg = unselected_bg, fg = C.color8 }, -- Selected buffer with errors on non-current windows.
    -- error_selected = {}, -- Selected buffer with errors.
    error_diagnostic = { bg = unselected_bg, fg = C.color8 },
    error_diagnostic_visible = { bg = unselected_bg, fg = C.color8 },
    -- error_diagnostic_selected = {},

    -- Buffer with warnings.
    warning = { bg = unselected_bg, fg = C.color8 }, -- Non-selected buffers with warnings.
    warning_visible = { bg = unselected_bg, fg = C.color8 }, -- Selected buffer with warnings on non-current windows.
    -- warning_selected = {}, -- Selected buffer with warnings.
    warning_diagnostic = { bg = unselected_bg, fg = C.color8 },
    warning_diagnostic_visible = { bg = unselected_bg, fg = C.color8 },
    -- warning_diagnostic_selected = {},

    -- Buffer with hints.
    hint = { bg = unselected_bg, fg = C.color8 }, -- Non-selected buffers with hints.
    hint_visible = { bg = unselected_bg, fg = C.color8 }, -- Selected buffer with hints on non-current windows.
    -- hint_selected = {}, -- Selected buffer with hints.
    hint_diagnostic = { bg = unselected_bg, fg = C.color8 },
    hint_diagnostic_visible = { bg = unselected_bg, fg = C.color8 },
    -- hint_diagnostic_selected = {},

    -- Buffer with informations.
    info = { bg = unselected_bg, fg = C.color8 }, -- Non-selected buffers with informations.
    info_visible = { bg = unselected_bg, fg = C.color8 }, -- Selected buffer with informations on non-current windows.
    -- info_selected = {}, -- Selected buffer with informations.
    info_diagnostic = { bg = unselected_bg, fg = C.color8 },
    info_diagnostic_visible = { bg = unselected_bg, fg = C.color8 },
    -- info_diagnostic_selected = {},
}

function M.setup(user_conf)
    user_conf = user_conf or {}
    local highlights = vim.tbl_deep_extend("keep", user_conf, default_highlights)

    for _, properties in pairs(highlights) do
        if properties.styles then
            for _, style in pairs(properties.styles) do
                properties[style] = true
                if O.no_italic and style == "italic" then properties[style] = false end
                if O.no_bold and style == "bold" then properties[style] = false end
                if O.no_underline and style == "underline" then properties[style] = false end
                if O.no_undercurl and style == "undercurl" then properties[style] = false end
                if O.no_strikethrough and style == "strikethrough" then properties[style] = false end
            end
        end
        properties.styles = nil
    end

    return highlights
end

return M

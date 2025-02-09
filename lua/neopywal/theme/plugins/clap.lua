local M = {}
local C = require("neopywal.lib.palette").get()
local O = require("neopywal.lib.config").options

---@type NeopywalPluginsClapOptions
M.default_options = {
    -- Any of the color values can either be:
    --   - A color exported by "get_colors()" (e.g.: `color8`)
    --   - A hexadecimal color (e.g.: "#ff0000").
    --   - A function with an optional "C" parameter that returns one of the two options above.
    --     e.g: function(C) return C.color1 end
    colors = {
        indicator = "color8", -- The text for the number of matches.
        spinner = "color2", -- The text representing the mode.
        selected = "color6", -- The text of the line of a selected item.
        current_selection = "color4", -- The text of the line of the currently selected item.
    },
    styles = {
        indicator = { "italic" }, -- The text for the number of matches.
        spinner = { "bold" }, -- The text representing the mode.
        selected = { "bold", "underline" }, -- The line for a selected item.
        current_selection = { "bold" }, -- The line for the currently selected item.
    },
}
M.options = M.default_options

local did_setup = false
---@param user_config NeopywalPluginsClapOptions?
function M.setup(user_config)
    user_config = user_config or {}
    M.options = vim.tbl_deep_extend("keep", user_config, M.default_options)

    for option in pairs(M.options.colors) do
        local default_color = C[M.default_options.colors[option]]
        local final_color = M.options.colors[option]
        if type(final_color) == "function" then final_color = final_color(C) end
        final_color = require("neopywal.utils.color").validate(final_color, default_color)
        M.options.colors[option] = final_color
    end

    local final_styles = {}
    for section, section_styles in pairs(M.options.styles) do
        local properties = {}

        for _, style in pairs(section_styles) do
            if not O.no_italic and style == "italic" then table.insert(properties, style) end
            if not O.no_bold and style == "bold" then table.insert(properties, style) end
            if not O.no_underline and style == "underline" then table.insert(properties, style) end
            if not O.no_undercurl and style == "undercurl" then table.insert(properties, style) end
            if not O.no_strikethrough and style == "strikethrough" then table.insert(properties, style) end
        end

        final_styles[section] = table.concat(properties, ",")
    end
    M.options.styles = final_styles

    did_setup = true
end

function M.get()
    if not did_setup then M.setup() end

    local neopywal = {}
    local bg = (O.transparent_background and vim.o.winblend == 0 and vim.o.pumblend == 0) and C.none or C.background
    local colors = M.options.colors
    local styles = M.options.styles

    neopywal.display = {
        guibg = bg,
        guifg = C.foreground,
        gui = "bold",
    }
    neopywal.input = neopywal.display
    neopywal.preview = neopywal.display
    neopywal.search_text = neopywal.display

    neopywal.indicator = { guibg = bg, guifg = colors.indicator, gui = styles.indicator or {} }
    neopywal.spinner = { guibg = bg, guifg = colors.spinner, gui = styles.spinner or {} }

    neopywal.selected = { guibg = C.cursorline, guifg = colors.selected, gui = styles.selected or {} }
    neopywal.selected_sign = neopywal.selected

    neopywal.current_selection =
        { guibg = C.cursorline, guifg = colors.current_selection, gui = styles.current_selection or {} }
    neopywal.current_selection_sign = neopywal.current_selection

    return neopywal
end

return M

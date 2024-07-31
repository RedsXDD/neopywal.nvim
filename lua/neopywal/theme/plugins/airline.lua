local M = {}
local C = require("neopywal.lib.palette").get()
local U = require("neopywal.utils.color")
local O = require("neopywal.lib.config").options

---@type NeopywalPluginsAirlineOptions
M.default_options = {
    -- Any of the color values can either be:
    --   - A color exported by "get_colors()" (e.g.: `color8`)
    --   - A hexadecimal color (e.g.: "#ff0000").
    --   - A function with an optional "C" parameter that returns one of the two options above.
    --     e.g: function(C) return C.color1 end
    mode_colors = {
        normal = "color4",
        visual = "color5",
        insert = "color6",
        commandline = "color1",
        replace = "color2",
        terminal = "color3",
    },

    -- This is the same as `mode_colors` except it uses cterm numbers instead (see `:h cterm`)
    -- e.g.: "normal = 4" means "ctermfg=4".
    cterm_colors = {
        normal = 4,
        visual = 5,
        insert = 6,
        commandline = 1,
        replace = 2,
        terminal = 3,
    },
    styles = {
        a = { "bold" },
        b = { "bold" },
        c = { "bold" },
        x = { "bold" },
        y = { "bold" },
        z = { "bold" },
    },
}
M.options = M.default_options

local did_setup = false
---@param user_config NeopywalPluginsAirlineOptions?
function M.setup(user_config)
    user_config = user_config or {}
    M.options = vim.tbl_deep_extend("keep", user_config, M.default_options)

    for option in pairs(M.options.mode_colors) do
        local default_color = C[M.default_options.mode_colors[option]]
        local final_color = M.options.mode_colors[option]
        if type(final_color) == "function" then final_color = final_color(C) end
        final_color = require("neopywal.utils.hex").validate(final_color, default_color)
        M.options.mode_colors[option] = final_color
    end

    for option in pairs(M.options.cterm_colors) do
        vim.validate({ option = { M.options.cterm_colors[option], "number" } })
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
    local mode_colors = M.options.mode_colors
    local cterm_colors = M.options.cterm_colors
    local styles = M.options.styles

    neopywal.normal = {
        airline_a = { C.background, mode_colors.normal, 0, cterm_colors.normal, styles.a }, -- guifg, guibg, ctermfg, ctermbg, styles
        airline_b = { C.foreground, U.blend(C.color8, C.background, 0.5), 15, 8, styles.b }, -- guifg, guibg, ctermfg, ctermbg, styles
        airline_c = { C.foreground, U.blend(C.color8, C.background, 0.3), 15, 0, styles.c }, -- guifg, guibg, ctermfg, ctermbg, styles
        airline_x = { C.foreground, U.blend(C.color8, C.background, 0.3), 15, 0, styles.x }, -- guifg, guibg, ctermfg, ctermbg, styles
        airline_y = { C.foreground, U.blend(C.color8, C.background, 0.5), 15, 8, styles.y }, -- guifg, guibg, ctermfg, ctermbg, styles
        airline_z = { C.background, mode_colors.normal, 0, cterm_colors.normal, styles.z }, -- guifg, guibg, ctermfg, ctermbg, styles
        airline_warning = { C.background, C.warn, 0, 208, styles.z },
        airline_warning_to_airline_error = { C.background, C.warn, 0, 208, styles.z },
        airline_error = { C.background, C.error, 0, 196, styles.z },
    }

    neopywal.visual = {
        airline_a = { C.background, mode_colors.visual, 0, cterm_colors.visual, styles.a }, -- guifg, guibg, ctermfg, ctermbg, styles
        airline_z = { C.background, mode_colors.visual, 0, cterm_colors.visual, styles.z }, -- guifg, guibg, ctermfg, ctermbg, styles
    }

    neopywal.insert = {
        airline_a = { C.background, mode_colors.insert, 0, cterm_colors.insert, styles.a }, -- guifg, guibg, ctermfg, ctermbg, styles
        airline_z = { C.background, mode_colors.insert, 0, cterm_colors.insert, styles.z }, -- guifg, guibg, ctermfg, ctermbg, styles
    }

    neopywal.commandline = {
        airline_a = { C.background, mode_colors.commandline, 0, cterm_colors.commandline, styles.a }, -- guifg, guibg, ctermfg, ctermbg, styles
        airline_z = { C.background, mode_colors.commandline, 0, cterm_colors.commandline, styles.z }, -- guifg, guibg, ctermfg, ctermbg, styles
    }

    neopywal.replace = {
        airline_a = { C.background, mode_colors.replace, 0, cterm_colors.replace, styles.a }, -- guifg, guibg, ctermfg, ctermbg, styles
        airline_z = { C.background, mode_colors.replace, 0, cterm_colors.replace, styles.z }, -- guifg, guibg, ctermfg, ctermbg, styles
    }

    neopywal.terminal = {
        airline_a = { C.background, mode_colors.terminal, 0, cterm_colors.terminal, styles.a }, -- guifg, guibg, ctermfg, ctermbg, styles
        airline_z = { C.background, mode_colors.terminal, 0, cterm_colors.terminal, styles.z }, -- guifg, guibg, ctermfg, ctermbg, styles
    }

    neopywal.inactive = {
        airline_a = neopywal.normal.airline_b,
        airline_b = neopywal.normal.airline_b,
        airline_c = neopywal.normal.airline_c,
        airline_x = neopywal.normal.airline_c,
        airline_y = neopywal.normal.airline_b,
        airline_z = neopywal.normal.airline_b,
        airline_warning = neopywal.normal.airline_warning,
        airline_warning_to_airline_error = neopywal.normal.airline_warning,
        airline_error = neopywal.normal.airline_error,
    }

    for mode in pairs(neopywal) do
        if mode ~= "normal" and mode ~= "inactive" then
            neopywal[mode].airline_b = neopywal.normal.airline_b
            neopywal[mode].airline_c = neopywal.normal.airline_c
            neopywal[mode].airline_x = neopywal.normal.airline_x
            neopywal[mode].airline_y = neopywal.normal.airline_y
            neopywal[mode].airline_warning = neopywal.normal.airline_warning
            neopywal[mode].airline_warning_to_airline_error = neopywal.normal.airline_warning
            neopywal[mode].airline_error = neopywal.normal.airline_error
        end
    end

    return neopywal
end

return M

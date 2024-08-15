-- Lualine variable formatting:
-- +-------------------------------------------------+
-- | A | B | C                             X | Y | Z |
-- +-------------------------------------------------+

---@type NeopywalPluginsLualine
---@diagnostic disable-next-line: missing-fields
local M = {}
local O = require("neopywal.lib.config").options
local C = require("neopywal.lib.palette").get()
local U = require("neopywal.utils.color")

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
        command = "color1",
        replace = "color2",
        terminal = "color3",
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
---@param user_config NeopywalPluginsLualineOptions?
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
    local neopywal = {}

    if not did_setup then M.setup() end

    local mode_colors = M.options.mode_colors
    local styles = M.options.styles

    -- Fix background colors for separators on the edge of statusline.
    vim.api.nvim_set_hl(0, "StatusLine", { bg = C.background, fg = C.foreground })

    neopywal.normal = {
        a = { bg = mode_colors.normal, fg = C.background, gui = styles.a },
        z = { bg = mode_colors.normal, fg = C.background, gui = styles.z },

        b = { bg = U.blend(C.color8, C.background, 0.5), fg = C.foreground, gui = styles.b },
        y = { bg = U.blend(C.color8, C.background, 0.5), fg = C.foreground, gui = styles.y },

        c = { bg = U.blend(C.color8, C.background, 0.3), fg = C.foreground, gui = styles.c },
        x = { bg = U.blend(C.color8, C.background, 0.3), fg = C.foreground, gui = styles.x },
    }

    neopywal.visual = {
        a = { bg = mode_colors.visual, fg = C.background, gui = styles.a },
        z = { bg = mode_colors.visual, fg = C.background, gui = styles.z },
    }

    neopywal.insert = {
        a = { bg = mode_colors.insert, fg = C.background, gui = styles.a },
        z = { bg = mode_colors.insert, fg = C.background, gui = styles.z },
    }

    neopywal.command = {
        a = { bg = mode_colors.command, fg = C.background, gui = styles.a },
        z = { bg = mode_colors.command, fg = C.background, gui = styles.z },
    }

    neopywal.replace = {
        a = { bg = mode_colors.replace, fg = C.background, gui = styles.a },
        z = { bg = mode_colors.replace, fg = C.background, gui = styles.z },
    }

    neopywal.terminal = {
        a = { bg = mode_colors.terminal, fg = C.background, gui = styles.a },
        z = { bg = mode_colors.terminal, fg = C.background, gui = styles.z },
    }

    neopywal.inactive = {
        a = { bg = C.background, fg = C.foreground, gui = styles.a },
        z = { bg = C.background, fg = C.foreground, gui = styles.z },
    }

    return neopywal
end

return M

local M = {}
local C = require("neopywal.lib.palette").get()
local U = require("neopywal.utils.color")

---@type NeopywalPluginsLightlineOptions
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
}
M.options = M.default_options

local did_setup = false
---@param user_config NeopywalPluginsLightlineOptions?
function M.setup(user_config)
    user_config = user_config or {}
    M.options = vim.tbl_deep_extend("keep", user_config, M.default_options)

    for option in pairs(M.options.mode_colors) do
        local default_color = C[M.default_options.mode_colors[option]]
        local final_color = M.options.mode_colors[option]
        if type(final_color) == "function" then final_color = final_color(C) end
        final_color = require("neopywal.utils.color").validate(final_color, default_color)
        M.options.mode_colors[option] = final_color
    end

    did_setup = true
end

function M.get()
    if not did_setup then M.setup() end

    local neopywal = {}
    local mode_colors = M.options.mode_colors

    neopywal.normal = {
        left = { { C.background, mode_colors.normal }, { C.foreground, U.blend(C.color8, C.background, 0.5) } },
        middle = { { C.foreground, U.blend(C.color8, C.background, 0.3) } },
        right = { { C.background, mode_colors.normal }, { C.foreground, U.blend(C.color8, C.background, 0.5) } },
        error = { { C.background, C.error } },
        warning = { { C.background, C.warn } },
    }

    neopywal.visual = {
        left = { { C.background, mode_colors.visual }, { C.foreground, U.blend(C.color8, C.background, 0.5) } },
        right = { { C.background, mode_colors.visual }, { C.foreground, U.blend(C.color8, C.background, 0.5) } },
    }

    neopywal.insert = {
        left = { { C.background, mode_colors.insert }, { C.foreground, U.blend(C.color8, C.background, 0.5) } },
        right = { { C.background, mode_colors.insert }, { C.foreground, U.blend(C.color8, C.background, 0.5) } },
    }

    neopywal.command = {
        left = { { C.background, mode_colors.command }, { C.foreground, U.blend(C.color8, C.background, 0.5) } },
        right = { { C.background, mode_colors.command }, { C.foreground, U.blend(C.color8, C.background, 0.5) } },
    }

    neopywal.replace = {
        left = { { C.background, mode_colors.replace }, { C.foreground, U.blend(C.color8, C.background, 0.5) } },
        right = { { C.background, mode_colors.replace }, { C.foreground, U.blend(C.color8, C.background, 0.5) } },
    }

    neopywal.terminal = {
        left = { { C.background, mode_colors.terminal }, { C.foreground, U.blend(C.color8, C.background, 0.5) } },
        right = { { C.background, mode_colors.terminal }, { C.foreground, U.blend(C.color8, C.background, 0.5) } },
    }

    neopywal.inactive = {
        left = {
            { mode_colors.normal, U.blend(C.color8, C.background, 0.5) },
            { U.blend(C.color8, C.background, 0.5), C.foreground },
        },
        middle = { { C.foreground, U.blend(C.color8, C.background, 0.3) } },
        right = {
            { mode_colors.normal, U.blend(C.color8, C.background, 0.5) },
            { C.foreground, U.blend(C.color8, C.background, 0.3) },
        },
    }

    neopywal.tabline = {
        left = { { C.foreground, U.blend(C.color8, C.background, 0.5) }, { C.color8, C.background } },
        middle = { { C.foreground, U.blend(C.color8, C.background, 0.3) } },
        right = { { C.background, C.color1 } },
        tabsel = { { C.background, mode_colors.normal }, { C.color8, C.background } },
    }

    return neopywal
end

return M

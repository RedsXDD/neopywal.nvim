local M = {}
local C = require("neopywal.lib.palette").get()
local U = require("neopywal.utils.color")

---@type NeopywalPluginsReactiveOptions
M.default_options = {
    -- A higher percentage means more vibrant mode colors,
    -- where "1" means to use "exactly" the mode color without any color transparency.
    color_percentage = 0.3,

    -- Any of the color values can either be:
    --   - A color exported by "get_colors()" (e.g.: `color8`)
    --   - A hexadecimal color (e.g.: "#ff0000").
    --   - A function with an optional "C" parameter that returns one of the two options above.
    --     e.g: function(C) return C.color1 end
    mode_colors = {
        visual = "color5",
        insert = "color6",
        replace = "color2",

        -- Normal mode operations.
        change = "color2",
        delete = "color1",
        pending = "color4",
        yank = "color3",
    },
}
M.options = M.default_options

local did_setup = false
---@param user_config NeopywalPluginsReactiveOptions?
function M.setup(user_config)
    user_config = user_config or {}
    M.options = vim.tbl_deep_extend("keep", user_config, M.default_options)

    if type(M.options.color_percentage) == "function" then M.options.color_percentage = M.options.color_percentage() end
    vim.validate({ color_percentage = { M.options.color_percentage, "number" } })

    for option in pairs(M.options.mode_colors) do
        local default_color = C[M.default_options.mode_colors[option]]
        local final_color = M.options.mode_colors[option]
        if type(final_color) == "function" then final_color = final_color(C) end
        final_color = require("neopywal.utils.hex").validate(final_color, default_color)
        M.options.mode_colors[option] = final_color
    end

    did_setup = true
end

---@param theme_type string? either "cursor" or "cursorline", defaults to "cursor".
function M.get(theme_type)
    if not did_setup then M.setup() end
    if not theme_type or theme_type ~= "cursor" and theme_type ~= "cursorline" then theme_type = "cursor" end

    local mode_colors = M.options.mode_colors
    local function blend(color) return U.blend(color, C.background, M.options.color_percentage) end

    local cursor_theme = {
        name = "neopywal-cursor",
        init = function() vim.opt.guicursor:append("a:ReactiveCursor") end,
        modes = {
            i = {
                hl = {
                    ReactiveCursor = { bg = mode_colors.insert },
                },
            },
            R = {
                hl = {
                    ReactiveCursor = { bg = mode_colors.replace },
                },
            },
            [{ "v", "V", "\x16", "s", "S", "\x13" }] = {
                hl = {
                    ReactiveCursor = { bg = mode_colors.visual },
                },
            },
            no = {
                operators = {
                    d = {
                        hl = {
                            ReactiveCursor = { bg = mode_colors.delete },
                        },
                    },
                    y = {
                        hl = {
                            ReactiveCursor = { bg = mode_colors.yank },
                        },
                    },
                    c = {
                        hl = {
                            ReactiveCursor = { bg = mode_colors.change },
                        },
                    },
                },
            },
        },
    }

    local cursorline_theme = {
        name = "neopywal-cursorline",
        static = {
            winhl = {
                inactive = {
                    CursorLine = { bg = C.cursorline },
                    CursorLineNr = { bg = C.cursorline },
                },
            },
        },
        modes = {
            i = {
                winhl = {
                    CursorLine = { bg = blend(mode_colors.insert) },
                    CursorLineNr = { bg = blend(mode_colors.insert) },
                },
            },
            R = {
                winhl = {
                    CursorLine = { bg = blend(mode_colors.replace) },
                    CursorLineNr = { bg = blend(mode_colors.replace) },
                },
            },
            [{ "v", "V", "\x16", "s", "S", "\x13" }] = {
                winhl = {
                    Visual = { bg = blend(mode_colors.visual) },
                    CursorLine = { bg = blend(mode_colors.visual) },
                    CursorLineNr = { bg = blend(mode_colors.visual) },
                },
            },
            n = {
                winhl = {
                    CursorLine = { bg = C.cursorline },
                    CursorLineNr = { bg = C.cursorline },
                },
            },
            no = {
                operators = {
                    [{ "gu", "gU", "g~", "~" }] = {
                        winhl = {
                            CursorLine = { bg = blend(mode_colors.pending) },
                            CursorLineNr = { bg = blend(mode_colors.pending) },
                        },
                    },
                    d = {
                        winhl = {
                            CursorLine = { bg = blend(mode_colors.delete) },
                            CursorLineNr = { bg = blend(mode_colors.delete) },
                        },
                    },
                    y = {
                        winhl = {
                            CursorLine = { bg = blend(mode_colors.yank) },
                            CursorLineNr = { bg = blend(mode_colors.yank) },
                        },
                    },
                    c = {
                        winhl = {
                            CursorLine = { bg = blend(mode_colors.change) },
                            CursorLineNr = { bg = blend(mode_colors.change) },
                        },
                    },
                },
            },
        },
    }

    if theme_type == "cursor" then
        return cursor_theme
    elseif theme_type == "cursorline" then
        return cursorline_theme
    end
end

return M

local M = {}

---@diagnostic disable-next-line: undefined-global
local compiler = require("neopywal.lib.compiler")
local notify = require("neopywal.utils.notify")

local cache_dir
if compiler.options.path_sep == "\\" then
    cache_dir = os.getenv("LOCALAPPDATA") -- Windows
else
    cache_dir = os.getenv("HOME") .. "/.cache" -- Linux/MacOS
end

M.default_options = {
    colorscheme_file = cache_dir .. "/wal/colors-wal.vim",
    use_palette = "",
    use_wallust = false,
    custom_colors = {},
}
M.options = M.default_options

local function check_nil_option(option, fallback_result)
    -- NOTE: `return option == nil and fallback_result or option`
    -- doesn't work because "option" will be returned if "fallback_result" is false.
    if option == nil then
        return fallback_result
    else
        return option
    end
end

-- This is the function that setups the path for the colorscheme file, as well as the user custom colors which later can be appended to the final palette.
M.did_setup = false
function M.setup(config)
    config = config or {}

    config.use_wallust = check_nil_option(config.use_wallust, M.default_options.use_wallust)
    if type(config.use_wallust) == "function" then config.use_wallust = config.use_wallust() end

    config.colorscheme_file = check_nil_option(config.colorscheme_file, M.default_options.colorscheme_file)
    if type(config.colorscheme_file) == "function" then config.colorscheme_file = config.colorscheme_file() end

    config.use_palette = check_nil_option(config.use_palette, M.default_options.use_palette)
    if type(config.use_palette) == "function" then config.use_palette = config.use_palette() end

    config.custom_colors = check_nil_option(config.custom_colors, M.default_options.custom_colors)

    M.options = vim.tbl_deep_extend("keep", config, M.default_options)

    local plugin_dir = debug.getinfo(1).source:sub(2, -25)
    local palette_dir = plugin_dir .. "palettes/"
    local template_file = M.options.use_palette ~= "" and "" .. palette_dir .. M.options.use_palette .. ".vim"
        or M.options.colorscheme_file ~= "" and M.options.colorscheme_file
        or M.options.use_wallust and cache_dir .. "/wallust/colors_neopywal.vim"
        or M.default_options.colorscheme_file

    if compiler.options.path_sep == "\\" then template_file = template_file:gsub("/", "\\") end
    M.options.colorscheme_file = template_file

    M.did_setup = true
end

--[[
    This is the function that actually exports the full palette. It has a few extra options compared to "M.get_colors()" which help for creating Neopywal's cache file and for setting up user colors.
    It also has an extra argument at the end that allows to append an arbitrary table to the exported palette.
    If a function is given the main "C" table will be passed to it as an argument.
    E.g.:
        M.get("dark", false, function(C) return { red = C.color1 }) end)
]]
---@param theme_style ThemeStyles?
---@param minimal_palette boolean?
---@param extra_colors table?
function M.get(theme_style, minimal_palette, extra_colors)
    if not M.did_setup then M.setup() end
    if not theme_style or theme_style ~= "dark" and theme_style ~= "light" then theme_style = vim.o.background end

    local U = require("neopywal.utils.color")

    local colorscheme_file = M.options.colorscheme_file
    local file_exists = vim.fn.filereadable(colorscheme_file) ~= 0
    if not file_exists then
        notify.error(
            string.format(
                "Colorscheme file '%s' could not be found, falling back to the builtin colorscheme.",
                colorscheme_file
            )
        )
    else
        ---@diagnostic disable-next-line: param-type-mismatch
        local could_load_file, error_msg = pcall(vim.cmd, "source " .. colorscheme_file)
        if not could_load_file then
            notify.error(string.format(
                [[
Unable to load the colorscheme file '%s', falling back to the builtin colorscheme.
Below is the error message that we captured:
%s]],
                colorscheme_file,
                error_msg
            ))
        end
    end

    -- Use fallback colors if template file couldn't be loaded.
    -- Fallback colors reference: https://github.com/catppuccin/catppuccin
    local palette = {
        dark = {
            background = (vim.g.background ~= nil) and vim.g.background or "#1E1E2E",
            foreground = (vim.g.foreground ~= nil) and vim.g.foreground or "#CDD6F4",
        },
        light = {
            background = (vim.g.foreground ~= nil) and vim.g.foreground or "#CDD6F4",
            foreground = (vim.g.background ~= nil) and vim.g.background or "#1E1E2E",
        },
        colors = {
            none = "NONE",
            cursor = (vim.g.cursor ~= nil) and vim.g.cursor or "#F5E0DC",
            color0 = (vim.g.color0 ~= nil) and vim.g.color0 or "#45475A",
            color1 = (vim.g.color1 ~= nil) and vim.g.color1 or "#F38BA8",
            color2 = (vim.g.color2 ~= nil) and vim.g.color2 or "#A6E3A1",
            color3 = (vim.g.color3 ~= nil) and vim.g.color3 or "#F9E2AF",
            color4 = (vim.g.color4 ~= nil) and vim.g.color4 or "#89B4FA",
            color5 = (vim.g.color5 ~= nil) and vim.g.color5 or "#F5C2E7",
            color6 = (vim.g.color6 ~= nil) and vim.g.color6 or "#94E2D5",
            color7 = (vim.g.color7 ~= nil) and vim.g.color7 or "#BAC2DE",
            color8 = (vim.g.color8 ~= nil) and vim.g.color8 or "#585B70",
            color9 = (vim.g.color9 ~= nil) and vim.g.color9 or "#F38BA8",
            color10 = (vim.g.color10 ~= nil) and vim.g.color10 or "#A6E3A1",
            color11 = (vim.g.color11 ~= nil) and vim.g.color11 or "#F9E2AF",
            color12 = (vim.g.color12 ~= nil) and vim.g.color12 or "#89B4FA",
            color13 = (vim.g.color13 ~= nil) and vim.g.color13 or "#F5C2E7",
            color14 = (vim.g.color14 ~= nil) and vim.g.color14 or "#94E2D5",
            color15 = (vim.g.color15 ~= nil) and vim.g.color15 or "#A6ADC8",
        },
    }

    -- Reset all global variables that have been used.
    vim.g.background = nil
    vim.g.foreground = nil
    vim.g.cursor = nil
    vim.g.color0 = nil
    vim.g.color1 = nil
    vim.g.color2 = nil
    vim.g.color3 = nil
    vim.g.color4 = nil
    vim.g.color5 = nil
    vim.g.color6 = nil
    vim.g.color7 = nil
    vim.g.color8 = nil
    vim.g.color9 = nil
    vim.g.color10 = nil
    vim.g.color11 = nil
    vim.g.color12 = nil
    vim.g.color13 = nil
    vim.g.color14 = nil
    vim.g.color15 = nil

    -- Return palette early if `minimal_palette` is enabled.
    local C = vim.tbl_deep_extend("keep", palette[theme_style], palette.colors)
    minimal_palette = minimal_palette or false
    if minimal_palette then return C end

    -- Setup user colors.
    extra_colors = extra_colors or {}
    if type(extra_colors) == "function" then extra_colors = extra_colors(C) end
    if type(M.options.custom_colors) == "function" then M.options.custom_colors = M.options.custom_colors(C) end
    extra_colors = vim.tbl_deep_extend("keep", extra_colors, M.options.custom_colors)

    local extra_palette = {
        -- Extras:
        dim_bg = U.darken(C.background, 5),
        comment = C.color8,
        cursorline = U.blend(C.background, C.foreground, 0.9),
        directory = C.color4,

        -- Diffs:
        diff_added = C.color2,
        diff_changed = C.color6,
        diff_removed = C.color1,
        diff_untracked = C.color5,

        -- LSP/Diagnostics:
        error = C.color1,
        hint = C.color6,
        info = C.foreground,
        unnecessary = C.color8,
        warn = U.blend(C.color1, C.color3, 0.5),
        ok = C.color2,
        inlay_hints = C.color8,

        -- Variable types:
        variable = C.color4, -- (preferred) any variable.
        constant = C.color3, -- (preferred) any constant
        string = C.foreground, -- a string constant: "this is a string"
        character = C.color3, -- a character constant: 'c', '\n'
        number = C.color5, -- a number constant: 234, 0xff
        boolean = C.color5, -- a boolean constant: TRUE, FALSE
        float = C.color5, -- a floating point constant: 2.3e10
        identifier = U.blend(C.color1, C.color3, 0.5), -- (preferred) any variable name
        func = C.color2, -- function name (also: methods for classes)

        -- Statements:
        statement = C.color1, -- (preferred) any statement
        conditional = C.color1, -- if, then, else, endif, switch, etc.
        loop = C.color1, -- for, do, while, etc.
        label = C.color1, -- case, default, etc.
        exception = C.color1, -- try, catch, throw
        operator = C.color1, -- "sizeof", "+", "*", etc.
        keyword = C.color1, -- any other keyword
        debug = C.color3, -- debugging statements.

        -- Preprocessors:
        preproc = C.color5, -- (preferred) generic Preprocessor
        include = C.color5, -- preprocessor #include
        define = C.color5, -- preprocessor #define
        macro = C.color5, -- same as Define
        precondit = C.color5, -- preprocessor #if, #else, #endif, etc.

        -- Type definitions:
        type = C.color6, -- (preferred) int, long, char, etc.
        structure = C.color6, -- struct, union, enum, etc.
        storageclass = C.color6, -- static, register, volatile, etc.
        typedef = C.color6, -- A typedef

        -- Special:
        special = C.color5, -- (preferred) any special symbol
        secialchar = C.color5, -- special character in a constant
        tag = U.blend(C.color1, C.color3, 0.5), -- you can use CTRL-] on this
        delimiter = C.foreground, -- character that needs attention
        specialcomment = C.color8, -- special things inside a comment
    }

    return vim.tbl_deep_extend("keep", extra_colors, extra_palette, C)
end

-- This works like the original "M.get_colors" function. It only accepts either "dark", "light", nil as a parameter and exports the full palette.
---@param theme_style ThemeStyles?
function M.get_colors(theme_style)
    if not theme_style or theme_style ~= "dark" and theme_style ~= "light" then theme_style = vim.o.background end
    return M.get(theme_style, false)
end

return M

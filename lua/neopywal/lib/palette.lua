local M = {}
local Compiler = require("neopywal.lib.compiler")
local Notify = require("neopywal.utils.notify")

M.default_options = {
    use_palette = {
        dark = "pywal",
        light = "pywal",
    },
    custom_colors = {},
}
M.options = M.default_options

---@return string
local function fixPathSep(path)
    if Compiler.options.path_sep == "\\" then
        return path:gsub("/", "\\")
    else
        return path
    end
end

-- This is the function that setups the path for the colorscheme file, as well as the user custom colors which later can be appended to the final palette.
M.did_setup = false
---@param config table?
function M.setup(config)
    config = config or {}

    M.options = vim.tbl_deep_extend("keep", config, M.default_options)

    if type(M.options.use_palette) == "function" then M.options.use_palette = M.options.use_palette() end
    if type(M.options.use_palette) == "string" then
        M.options.use_palette = { dark = M.options.use_palette, light = M.options.use_palette }
    end

    local cache_dir
    if Compiler.options.path_sep == "\\" then
        cache_dir = os.getenv("LOCALAPPDATA") -- Windows
    else
        cache_dir = os.getenv("HOME") .. "/.cache" -- Linux/MacOS
    end

    local program_palette_map = {
        wal = cache_dir .. "/wal/colors-wal.vim",
        pywal = cache_dir .. "/wal/colors-wal.vim",
        wallust = cache_dir .. "/wallust/colors_neopywal.vim",
    }

    -- List of supported builting palettes.
    local builtin_palette_map = {
        ["catppuccin-frappe"] = true,
        ["catppuccin-macchiato"] = true,
        ["catppuccin-mocha"] = true,
        ["doomone"] = true,
        ["everforest-hard"] = true,
        ["everforest-medium"] = true,
        ["everforest-soft"] = true,
        ["gruvbox-dark"] = true,
        ["gruvbox-hard"] = true,
        ["gruvbox-soft"] = true,
        ["material"] = true,
        ["material-darker"] = true,
        ["material-ocean"] = true,
        ["material-palenight"] = true,
        ["monokaipro"] = true,
        ["nord"] = true,
        ["oceanic-next"] = true,
        ["onedark"] = true,
        ["onedark-darker"] = true,
        ["onedark-vivid"] = true,
        ["palenight"] = true,
        ["solarized"] = true,
        ["sonokai"] = true,
        ["tokyonight"] = true,
        ["tokyonight-storm"] = true,
        ["tomorrow-night"] = true,
    }

    for option, value in pairs(M.options.use_palette) do
        local function getkey(key)
            if builtin_palette_map[key] ~= nil then return key end
        end

        local file_path = program_palette_map[value]
            or builtin_palette_map[value] and "neopywal.palettes." .. getkey(value)
            or value

        M.options.use_palette[option] = fixPathSep(file_path)
    end

    M.did_setup = true
end

--[[
    This is the function that actually exports the full palette. It has a few extra options compared to "M.get_colors()" which help for creating Neopywal's cache file and for setting up user colors.
    It also has an extra argument at the end that allows to append an arbitrary table to the exported palette.
    If a function is given the main "C" table will be passed to it as an argument.
    E.g.:
        M.get("dark", false, function(C) return { red = C.color1 }) end)
]]
---@return NeopywalPalette
---@param theme_style ThemeStyles?
---@param minimal_palette boolean?
---@param extra_colors CustomColorsOption | fun(C: table<ValidColors[]>?): { [string]: string }?
function M.get(theme_style, minimal_palette, extra_colors)
    if not M.did_setup then M.setup() end
    if not theme_style or theme_style ~= "dark" and theme_style ~= "light" then theme_style = vim.o.background end

    ---@type string
    local colorscheme_file = fixPathSep(M.options.use_palette[theme_style])

    local file_exists = vim.fn.filereadable(colorscheme_file) ~= 0
    local file_is_requireable, file = pcall(require, colorscheme_file)

    if file_is_requireable then
        file.get()
    elseif not file_exists then
        Notify.error(
            string.format(
                "Colorscheme file '%s' could not be found, falling back to the builtin colorscheme.",
                colorscheme_file
            )
        )
    else
        ---@diagnostic disable-next-line: param-type-mismatch
        local could_source_file, error_msg = pcall(vim.cmd, "source " .. colorscheme_file)
        if not could_source_file then
            Notify.error(string.format(
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
            cursor = (vim.g.cursor ~= nil) and vim.g.cursor or "#CDD6F4",
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
    ---@diagnostic disable-next-line: cast-local-type
    if type(extra_colors) == "function" then extra_colors = extra_colors(C) end

    local custom_colors = M.options.custom_colors
    if type(custom_colors) == "function" then custom_colors = custom_colors(C) end
    ---@cast extra_colors table
    extra_colors = vim.tbl_deep_extend(
        "keep",

        -- Handle extra_colors function paramater.
        type(extra_colors[theme_style]) == "function" and extra_colors[theme_style](C)
            or extra_colors[theme_style]
            or {},
        type(extra_colors.all) == "function" and extra_colors.all(C) or extra_colors.all or {},

        -- Handle M.options.custom_colors table
        type(custom_colors[theme_style]) == "function" and custom_colors[theme_style](C)
            or custom_colors[theme_style]
            or {},
        type(custom_colors.all) == "function" and custom_colors.all(C) or custom_colors.all or {}
    )

    local U = require("neopywal.utils.color")
    local extra_palette = {
        -- Misc:
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

    ---@diagnostic disable-next-line: return-type-mismatch
    return vim.tbl_deep_extend("keep", extra_colors, extra_palette, C)
end

return M

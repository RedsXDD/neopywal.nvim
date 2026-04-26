local M = {}
local path_sep = jit and (jit.os == "Windows" and "\\" or "/") or package.config:sub(1, 1)

-- Reference: https://github.com/catppuccin/catppuccin
local fallback_p = {
    background = "#1e1e2e",
    foreground = "#cdd6f4",
    cursor = "#cdd6f4",
    color0 = "#45475a",
    color1 = "#f38ba8",
    color2 = "#a6e3a1",
    color3 = "#f9e2af",
    color4 = "#89b4fa",
    color5 = "#f5c2e7",
    color6 = "#94e2d5",
    color7 = "#bac2de",
    color8 = "#585b70",
    color9 = "#f38ba8",
    color10 = "#a6e3a1",
    color11 = "#f9e2af",
    color12 = "#89b4fa",
    color13 = "#f5c2e7",
    color14 = "#94e2d5",
    color15 = "#a6adc8",
}

M.palette_metadata = { dark = {}, light = {} }
M.default_options = {
    use_palette = {
        dark = "pywal",
        light = "pywal",
    },
    custom_colors = {},
}
M.options = M.default_options

-- This function only exists to return the most minimal possible palette for config.lua hashing algo,
-- supposedly improving performance slightly. The palette is even more minimal than the one returned by
-- require("neopywal").get_colors() as that one also requires extra processing power for the light theme variant.
---@return NeopywalMinimalPalette
---@param theme_style? ThemeStyles
function M.get_minpalette(theme_style)
    if not M.did_setup then M.setup() end
    if not theme_style or theme_style ~= "dark" and theme_style ~= "light" then theme_style = vim.o.background end

    -- The gotos statements require me to declare the variables first, weird ...
    local is_sourceable, error_msg
    if not M.palette_metadata[theme_style].file_exists then
        local Notify = require("neopywal.utils.notify")
        Notify.error(
            string.format(
                "Colorscheme file '%s' could not be found, falling back to the builtin colorscheme.",
                M.palette_metadata[theme_style].filepath
            )
        )
        goto return_palette
    end

    if M.palette_metadata[theme_style].is_requireable then
        local could_require, file = pcall(require, M.palette_metadata[theme_style].filepath)
        if could_require and file.get and type(file.get) == "function" then file.get() end
        goto return_palette
    end

    ---@diagnostic disable-next-line: param-type-mismatch
    is_sourceable, error_msg = pcall(vim.cmd, "source " .. M.palette_metadata[theme_style].filepath)
    if not is_sourceable then
        local Notify = require("neopywal.utils.notify")
        Notify.error(string.format(
            [[
         Unable to load the colorscheme file '%s', falling back to the builtin colorscheme.
         Below is the error message that we captured:
         %s]],
            M.palette_metadata[theme_style].filepath,
            error_msg
        ))
    end

    -- Use fallback colors if template file couldn't be loaded.
    ::return_palette::
    local ret = {
        background = (vim.g.background ~= nil) and vim.g.background or fallback_p.background,
        foreground = (vim.g.foreground ~= nil) and vim.g.foreground or fallback_p.foreground,
        cursor = (vim.g.cursor ~= nil) and vim.g.cursor or fallback_p.cursor,
        color0 = (vim.g.color0 ~= nil) and vim.g.color0 or fallback_p.color0,
        color1 = (vim.g.color1 ~= nil) and vim.g.color1 or fallback_p.color1,
        color2 = (vim.g.color2 ~= nil) and vim.g.color2 or fallback_p.color2,
        color3 = (vim.g.color3 ~= nil) and vim.g.color3 or fallback_p.color3,
        color4 = (vim.g.color4 ~= nil) and vim.g.color4 or fallback_p.color4,
        color5 = (vim.g.color5 ~= nil) and vim.g.color5 or fallback_p.color5,
        color6 = (vim.g.color6 ~= nil) and vim.g.color6 or fallback_p.color6,
        color7 = (vim.g.color7 ~= nil) and vim.g.color7 or fallback_p.color7,
        color8 = (vim.g.color8 ~= nil) and vim.g.color8 or fallback_p.color8,
        color9 = (vim.g.color9 ~= nil) and vim.g.color9 or fallback_p.color9,
        color10 = (vim.g.color10 ~= nil) and vim.g.color10 or fallback_p.color10,
        color11 = (vim.g.color11 ~= nil) and vim.g.color11 or fallback_p.color11,
        color12 = (vim.g.color12 ~= nil) and vim.g.color12 or fallback_p.color12,
        color13 = (vim.g.color13 ~= nil) and vim.g.color13 or fallback_p.color13,
        color14 = (vim.g.color14 ~= nil) and vim.g.color14 or fallback_p.color14,
        color15 = (vim.g.color15 ~= nil) and vim.g.color15 or fallback_p.color15,
    }

    -- Reset all global variables that have been used.
    -- Also string.lower() all color variables.
    local var_patterns = { "background", "foreground", "cursor" }
    for i = 0, 15 do
        table.insert(var_patterns, "color" .. i)
    end

    for _, var in ipairs(var_patterns) do
        vim.g[var] = nil
        ret[var] = string.lower(ret[var])
    end

    return ret
end

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
    if path_sep == "\\" then
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

    local metadata = { dark = {}, light = {} }
    for theme_style, value in pairs(M.options.use_palette) do
        if theme_style == "dark" or theme_style == "light" then
            local filepath = program_palette_map[value]
                or builtin_palette_map[value] and "neopywal.palettes." .. value
                or value

            filepath = path_sep == "\\" and filepath:gsub("/", "\\") or filepath
            metadata[theme_style].filepath = filepath
            metadata[theme_style].is_requireable = builtin_palette_map[value] ~= nil

            if metadata[theme_style].is_requireable then
                metadata[theme_style].file_exists = true
            else
                if vim.fn.filereadable(filepath) then metadata[theme_style].file_exists = true end
            end

            M.palette_metadata[theme_style] = metadata[theme_style]
            M.options.use_palette[theme_style] = metadata[theme_style].filepath
        end
    end

    M.did_setup = true
end

---@return NeopywalPalette
---@param theme_style? ThemeStyles
---@param minimal_palette? boolean
---@param extra_colors? CustomColorsOption | fun(C: table<ValidColors[]>?): { [string]: string }
function M.get(theme_style, minimal_palette, extra_colors)
    if not M.did_setup then M.setup() end
    if not theme_style or theme_style ~= "dark" and theme_style ~= "light" then theme_style = vim.o.background end

    local LightTheme = require("neopywal.utils.light")
    local minpalette = M.get_minpalette(theme_style)
    local palette = {
        dark = minpalette,
        light = LightTheme.convert_dark2light_theme(minpalette),
    }

    -- Return palette early if `minimal_palette` is enabled.
    palette.dark.none, palette.light.none = "NONE", "NONE"
    local C = palette[theme_style]
    minimal_palette = minimal_palette or false
    if minimal_palette then return C end

    -- Setup user colors.
    extra_colors = extra_colors or {}
    ---@diagnostic disable-next-line: cast-local-type
    if type(extra_colors) == "function" then extra_colors = extra_colors(C) end

    -- Import from require("neopywal").setup({ custom_colors = {} })
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
        constant = C.color3, -- (preferred) any constant.
        string = C.foreground, -- a string constant: "this is a string".
        character = C.color3, -- a character constant: 'c', '\n'.
        number = C.color5, -- a number constant: 234, 0xff.
        boolean = C.color5, -- a boolean constant: TRUE, FALSE.
        float = C.color5, -- a floating point constant: 2.3e10.
        identifier = U.blend(C.color1, C.color3, 0.5), -- (preferred) any variable name.
        func = C.color2, -- function name (also: methods for classes).

        -- Statements:
        statement = C.color1, -- (preferred) any statement.
        conditional = C.color1, -- if, then, else, endif, switch, etc.
        loop = C.color1, -- for, do, while, etc.
        label = C.color1, -- case, default, etc.
        exception = C.color1, -- try, catch, throw.
        operator = C.color1, -- "sizeof", "+", "*", etc.
        keyword = C.color1, -- any other keyword.
        debug = C.color3, -- debugging statements.

        -- Preprocessors:
        preproc = C.color5, -- (preferred) generic Preprocessor.
        include = C.color5, -- preprocessor #include.
        define = C.color5, -- preprocessor #define.
        macro = C.color5, -- same as Define.
        precondit = C.color5, -- preprocessor #if, #else, #endif, etc.

        -- Type definitions:
        type = C.color6, -- (preferred) int, long, char, etc.
        structure = C.color6, -- struct, union, enum, etc.
        storageclass = C.color6, -- static, register, volatile, etc.
        typedef = C.color6, -- A typedef.

        -- Special:
        special = C.color5, -- (preferred) any special symbol.
        secialchar = C.color5, -- special character in a constant.
        tag = U.blend(C.color1, C.color3, 0.5), -- you can use CTRL-] on this.
        delimiter = C.foreground, -- character that needs attention.
        specialcomment = C.color8, -- special things inside a comment.
    }

    ---@diagnostic disable-next-line: return-type-mismatch
    return vim.tbl_deep_extend("keep", extra_colors, extra_palette, C)
end

return M

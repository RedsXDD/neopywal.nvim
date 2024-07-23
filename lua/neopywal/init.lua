---@type Neopywal
---@diagnostic disable-next-line: missing-fields
local M = {}
local U = require("neopywal.utils.color")
local notify = require("neopywal.lib.notify")
local compiler = require("neopywal.lib.compiler")

M.compiler = {
    ---@diagnostic disable-next-line: undefined-global
    path_sep = jit and (jit.os == "Windows" and "\\" or "/") or package.config:sub(1, 1),
    filename = "neopywal",
    compile_path = vim.fn.stdpath("cache") .. "/neopywal",
}
local G = M.compiler

M.default_options = {
    -- Uses a template file `~/.cache/wallust/colors_neopywal.vim` instead of the
    -- regular pywal template at `~/.cache/wal/colors-wal.vim`.
    use_wallust = false,

    -- This option allows to specify where Neopywal should look for a ".vim" template file
    -- (e.g.: os.getenv("HOME") .. "/.cache/wal/custom_neopywal_template.vim").
    colorscheme_file = "",

    -- This option allows to use a custom built-in theme palettes like "catppuccin-mocha" or "tokyonight".
    -- To get the list of available themes take a look at `https://github.com/RedsXDD/neopywal.nvim#Alternative-Palettes`.
    -- Take note that this option takes precedence over `use_wallust` and `colorscheme_file`.
    use_palette = "",

    -- Sets the background color of certain highlight groups to be transparent.
    -- Use this when your terminal opacity is < 1.
    transparent_background = false,

    -- With this option you can overwrite all the base colors the colorscheme uses.
    -- For more information take a look at `https://github.com/RedsXDD/neopywal.nvim#Customizing-Colors`
    custom_colors = {},

    -- With this option you can overwrite any highlight groups set by the colorscheme.
    -- For more information take a look at `https://github.com/RedsXDD/neopywal.nvim#Customizing-Highlights`
    custom_highlights = {},

    -- Dims the background when another window is focused.
    dim_inactive = true,

    -- Apply colorscheme for Neovim's terminal (e.g. `g:terminal_color_0`).
    terminal_colors = true,

    -- Shows the '~' characters after the end of buffers.
    show_end_of_buffer = false,

    -- Shows the '|' split separator characters.
    -- It's worth noting that this options works better in conjunction with `dim_inactive`.
    show_split_lines = true,

    no_italic = false, -- Force no italic.
    no_bold = false, -- Force no bold.
    no_underline = false, -- Force no underline.
    no_undercurl = false, -- Force no undercurl.
    no_strikethrough = false, -- Force no strikethrough.

    -- Handles the styling of certain highlight groups (see `:h highlight-args`).
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        includes = { "italic" },
        strings = {},
        variables = { "italic" },
        numbers = {},
        booleans = {},
        types = { "italic" },
        operators = {},
    },

    -- Setting this to false disables all default file format highlights.
    -- Useful if you want to enable specific file format options.
    -- Defaults to false when treesitter is enabled,
    -- unless manually enabled inside the `setup()` function.
    default_fileformats = true,

    -- Setting this to false disables all default plugin highlights.
    -- Useful if you want to enable specific plugin options.
    default_plugins = true,

    fileformats = {
        c_cpp = true,
        c_sharp = true,
        clojure = true,
        cmake = true,
        common_lisp = true,
        css = true,
        dart = true,
        diff = true,
        elixir = true,
        erlang = true,
        git_commit = true,
        go = true,
        haskell = true,
        help = true,
        html = true,
        ini = true,
        java = true,
        javascript = true,
        javascript_react = true,
        json = true,
        kotlin = true,
        latex = true,
        less = true,
        lua = true,
        makefile = true,
        markdown = true,
        matlab = true,
        objectivec = true,
        ocaml = true,
        perl = true,
        php = true,
        powershell = true,
        python = true,
        restructuredtext = true,
        ruby = true,
        rust = true,
        sass = true,
        scala = true,
        shell = true,
        swift = true,
        toml = true,
        typescript = true,
        viml = true,
        xml = true,
        yaml = true,
        zsh = true,
    },
    plugins = {
        aerial = true,
        alpha = true,
        coc = true,
        colorful_winsep = {
            enabled = false,

            -- One of Neopywal's colors exported by "get_colors()" (e.g.: `color8`)
            -- or a hexadecimal color (e.g.: "#ff0000"), default: `color4`
            color = "",
        },
        dashboard = true,
        flash = {
            enabled = true,
            style = { "bold", "italic" },
        },
        git_gutter = true,
        gitsigns = true,
        indent_blankline = {
            enabled = true,

            -- One of Neopywal's colors exported by "get_colors()" (e.g.: `color8`)
            -- or a hexadecimal color (e.g.: "#ff0000"), default: `comment`
            scope_color = "",
            colored_indent_levels = false,
        },
        lazy = true,
        lazygit = true,
        lsp = {
            enabled = true,
            virtual_text = {
                errors = { "bold", "italic" },
                hints = { "bold", "italic" },
                information = { "bold", "italic" },
                ok = { "bold", "italic" },
                warnings = { "bold", "italic" },
                unnecessary = { "bold", "italic" },
            },
            underlines = {
                errors = { "undercurl" },
                hints = { "undercurl" },
                information = { "undercurl" },
                ok = { "undercurl" },
                warnings = { "undercurl" },
            },
            inlay_hints = {
                background = true,
                style = { "bold", "italic" },
            },
        },
        neotree = true,
        netrw = true,
        noice = true,
        notify = true,
        nvim_cmp = true,
        symbols_outline = false,
        telescope = {
            enabled = true,
            -- style = "nvchad",
        },
        treesitter = true,
        undotree = true,
        which_key = true,
        mini = {
            animate = true,
            clue = true,
            completion = {
                enabled = true,
                parameter_style = { "underline" },
            },
            cursorword = {
                enabled = true,
                style = { "underline" },
            },
            deps = true,
            diff = true,
            files = true,
            hipatterns = {
                enabled = true,
                style = {
                    fixme = { "bold", "italic" },
                    hack = { "bold", "italic" },
                    note = { "bold", "italic" },
                    todo = { "bold", "italic" },
                },
            },
            icons = true,
            indentscope = {
                enabled = true,

                -- One of Neopywal's colors exported by "get_colors()" (e.g.: `color8`)
                -- or a hexadecimal color (e.g.: "#ff0000"), default: `comment`
                scope_color = "",
            },
            jump = {
                enabled = true,
                style = { "bold", "italic" },
            },
            jump2d = {
                enabled = true,
                style = { "bold", "italic" },
            },
            map = true,
            notify = true,
            operators = true,
            pick = true,
            starter = true,
            statusline = {
                enabled = true,

                -- Any of the color values must be one of Neopywal's colors
                -- exported by "get_colors()" (e.g.: `color8`)
                -- or a hexadecimal color (e.g.: "#ff0000").
                mode_colors = {
                    normal = "color4",
                    visual = "color5",
                    insert = "color6",
                    command = "color1",
                    replace = "color2",
                    other = "color3", -- e.g.: terminal.
                },
            },
            surround = true,
            tabline = true,
            test = true,
            trailspace = {
                enabled = true,

                -- One of Neopywal's colors exported by "get_colors()" (e.g.: `color8`)
                -- or a hexadecimal color (e.g.: "#ff0000"), default: `warn`
                color = "",
            },
        },
    },
}
M.options = M.default_options

local function get_colorscheme_file()
    local cache_dir
    local colorscheme_file = ""
    local plugin_dir = debug.getinfo(1).source:sub(2, -22)
    local palette_dir = plugin_dir .. "palettes/"

    if G.path_sep == "\\" then
        cache_dir = os.getenv("LOCALAPPDATA") -- Windows
    else
        cache_dir = os.getenv("HOME") .. "/.cache" -- Linux/MacOS
    end

	-- stylua: ignore
	colorscheme_file = (type(M.options.use_palette) == "string" and M.options.use_palette ~= "") and "" .. palette_dir .. M.options.use_palette .. ".vim" or
                (type(M.options.colorscheme_file) == "string" and M.options.colorscheme_file ~= "") and M.options.colorscheme_file
		or M.options.use_wallust == true and cache_dir .. "/wallust/colors_neopywal.vim"
		or cache_dir .. "/wal/colors-wal.vim"

    if G.path_sep == "\\" then colorscheme_file = colorscheme_file:gsub("/", "\\") end

    return colorscheme_file
end

---@param theme_style? ThemeStyles
---@param export_user_colors boolean
local function get_palette(theme_style, export_user_colors)
    if not theme_style or theme_style ~= "dark" and theme_style ~= "light" then theme_style = vim.o.background end

    if type(M.options.colorscheme_file) ~= "string" then
        notify.error("`colorscheme_file` option must be of type string.")
    end

    if M.options.colorscheme_file == "" then M.options.colorscheme_file = get_colorscheme_file() end
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

    local user_colors = {}
    local C = vim.tbl_deep_extend("keep", palette[theme_style], palette.colors)
    if export_user_colors == true then
        user_colors = M.options.custom_colors
        if type(user_colors) == "function" then user_colors = user_colors(C) end
    end

    return vim.tbl_deep_extend("keep", user_colors, C)
end

---@param theme_style? ThemeStyles
function M.get_colors(theme_style)
    if not theme_style or theme_style ~= "dark" and theme_style ~= "light" then theme_style = vim.o.background end
    local C = get_palette(theme_style, true)

    local extra_colors = {
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

    return vim.tbl_deep_extend("keep", C, extra_colors)
end

---@param user_config? NeopywalOptions
local function gen_cache(user_config)
    user_config = user_config or {}

    -- Get cached hash.
    local cached_path = G.compile_path .. G.path_sep .. "cached"
    local file = io.open(cached_path)
    local cached = nil
    if file then
        cached = file:read()
        file:close()
    end

    -- Get current hash.
    local minimal_palette = get_palette(nil, true)
    local git_path = debug.getinfo(1).source:sub(2, -22) .. ".git"
    local git = vim.fn.getftime(git_path) -- 2x faster vim.loop.fs_stat
    local hash = require("neopywal.lib.hashing").hash({ user_config, minimal_palette })
        .. (git == -1 and git_path or git) -- no .git in /nix/store -> cache path
        .. (vim.o.winblend == 0 and 1 or 0) -- :h winblend
        .. (vim.o.pumblend == 0 and 1 or 0) -- :h pumblend

    -- Recompile if hash changed.
    if cached ~= hash then
        compiler.compile()
        file = io.open(cached_path, "wb")
        if file then
            file:write(hash)
            file:close()
        end
    end
end

---@param original_table table
---@param default_option any
local function disable_table(original_table, default_option)
    return not default_option
            and vim.tbl_map(function(option)
                if type(option) == "table" and option.enabled then
                    option.enabled = false
                elseif option == true then
                    option = false
                end
                return option
            end, original_table)
        or original_table
end

local function check_nil_option(option, fallback_result)
    -- NOTE: `return option == nil and fallback_result or option`
    -- doesn't work because "option" will be returned if "fallback_result" is false.
    if option == nil then
        return fallback_result
    else
        return option
    end
end

local did_setup = false
---@param user_config? NeopywalOptions
function M.setup(user_config)
    user_config = user_config or {}
    user_config.plugins = check_nil_option(user_config.plugins, {})

    -- Handle plugin tables.
    M.default_options.default_plugins = check_nil_option(user_config.default_plugins, M.default_options.default_plugins)
    M.default_options.plugins = disable_table(M.default_options.plugins, M.default_options.default_plugins)
    M.default_options.plugins.mini = disable_table(M.default_options.plugins.mini, M.default_options.default_plugins)

    -- Disable fileformats if treesitter is enabled (unless the user manually specifies otherwise).
    M.default_options.default_fileformats = check_nil_option(
        user_config.default_fileformats,
        not check_nil_option(user_config.plugins.treesitter, M.default_options.plugins.treesitter)
    )
    M.default_options.fileformats = disable_table(M.default_options.fileformats, M.default_options.default_fileformats)

    -- Create the final configuration table.
    M.options = vim.tbl_deep_extend("keep", user_config, M.default_options)

    -- Neovide doesn't play well with transparent background colors.
    M.options.transparent_background = not vim.g.neovide and M.options.transparent_background or false

    -- For backwards compatability (check `https://github.com/RedsXDD/neopywal.nvim/commit/f2973005932257b81dbd10bca67ce51490bf7599`).
    M.options.plugins.lsp = vim.tbl_deep_extend(
        "keep",
        type(M.options.plugins.lsp) == "boolean" and { enabled = M.options.plugins.lsp } or M.options.plugins.lsp,
        type(M.options.styles.lsp) == "table" and M.options.styles.lsp or {},
        M.default_options.plugins.lsp
    )

    gen_cache(user_config)
    did_setup = true
end

local lock = false -- Avoid g:colors_name reloading
---@param theme_style? ThemeStyles
function M.load(theme_style)
    if lock then return end
    if not did_setup then gen_cache() end

    local bg = vim.o.background
    local style_bg = (theme_style ~= "dark" and theme_style ~= "light") and bg or theme_style
    if style_bg ~= bg then
        if vim.g.colors_name == "neopywal-" .. style_bg then
            style_bg = (bg == "light" and style_bg == "dark") and "light" or "dark"
        else
            vim.o.background = style_bg
        end
    end

    M.current_style = style_bg
    local filename = G.filename .. "-" .. M.current_style
    local compiled_path = G.compile_path .. G.path_sep .. filename

    lock = true
    local f = loadfile(compiled_path)
    if not f then
        compiler.compile()
        f = assert(loadfile(compiled_path), "could not load neopywal cache.")
    end
    f()
    lock = false
end

vim.api.nvim_create_user_command("NeopywalCompile", function()
    for name, _ in pairs(package.loaded) do
        if name:match("^neopywal.") then package.loaded[name] = nil end
    end
    compiler.compile()
    notify.info("Successfully compiled cache.")
    vim.cmd.colorscheme("neopywal")
end, {})

if vim.g.neopywal_debug then
    vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*/neopywal/*",
        callback = function()
            vim.schedule(function() vim.cmd("NeopywalCompile") end)
        end,
    })
end

return M

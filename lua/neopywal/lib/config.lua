local M = {}
local palette = require("neopywal.lib.palette")
local compiler = require("neopywal.lib.compiler")

---@type NeopywalOptions
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
        ale = false,
        alpha = true,
        beacon = {
            enabled = false,

            -- Can either be:
            --   - A color exported by "get_colors()" (e.g.: `color8`)
            --   - A hexadecimal color (e.g.: "#ff0000").
            --   - A function with an optional "C" parameter that returns one of the two options above.
            --     e.g: function(C) return C.color1 end
            color = "",
        },
        coc = false,
        colorful_winsep = {
            enabled = false,

            -- Can either be:
            --   - A color exported by "get_colors()" (e.g.: `color8`)
            --   - A hexadecimal color (e.g.: "#ff0000").
            --   - A function with an optional "C" parameter that returns one of the two options above.
            --     e.g: function(C) return C.color1 end
            color = "",
        },
        dashboard = true,
        flash = {
            enabled = true,
            style = { "bold", "italic" },
        },
        git_gutter = true,
        gitsigns = true,
        harpoon = false,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,

            -- Can either be:
            --   - A color exported by "get_colors()" (e.g.: `color8`)
            --   - A hexadecimal color (e.g.: "#ff0000").
            --   - A function with an optional "C" parameter that returns one of the two options above.
            --     e.g: function(C) return C.color1 end
            scope_color = "",
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
        navic = {
            enabled = false,
            dim_text = false, -- Whether the text should be dimmed.
            hide_separator = false, -- Whether to hide the separator character.
            text_style = { "bold" },

            -- Can either be:
            --   - A color exported by "get_colors()" (e.g.: `color8`)
            --   - A hexadecimal color (e.g.: "#ff0000").
            --   - A function with an optional "C" parameter that returns one of the two options above.
            --     e.g: function(C) return C.color1 end
            bg_color = "",
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

                -- Can either be:
                --   - A color exported by "get_colors()" (e.g.: `color8`)
                --   - A hexadecimal color (e.g.: "#ff0000").
                --   - A function with an optional "C" parameter that returns one of the two options above.
                --     e.g: function(C) return C.color1 end
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
                    other = "color3", -- e.g.: terminal.
                },
            },
            surround = true,
            tabline = true,
            test = true,
            trailspace = {
                enabled = true,

                -- Can either be:
                --   - A color exported by "get_colors()" (e.g.: `color8`)
                --   - A hexadecimal color (e.g.: "#ff0000").
                --   - A function with an optional "C" parameter that returns one of the two options above.
                --     e.g: function(C) return C.color1 end
                color = "",
            },
        },
    },
}
M.options = M.default_options

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

M.did_setup = false
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

    -- Coc.nvim depeds on lsp highlights.
    M.options.plugins.lsp.enabled = M.options.plugins.coc or M.options.plugins.lsp.enabled

    -- Setup new palette configuration.
    palette.setup({
        colorscheme_file = M.options.colorscheme_file,
        use_palette = M.options.use_palette,
        use_wallust = M.options.use_wallust,
        custom_colors = M.options.custom_colors,
    })

    -- Get cached hash.
    local cached_path = compiler.options.compile_path .. compiler.options.path_sep .. "cached"
    local file = io.open(cached_path)
    local cached = nil
    if file then
        cached = file:read()
        file:close()
    end

    -- Get current hash.
    local minimal_palette = palette.get(nil, true)
    local git_path = debug.getinfo(1).source:sub(2, -28) .. ".git"
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

    M.did_setup = true
end

return M

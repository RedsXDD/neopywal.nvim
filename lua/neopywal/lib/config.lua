---@type NeopywalConfig
---@diagnostic disable-next-line: missing-fields
local M = {}
local Palette = require("neopywal.lib.palette")
local Compiler = require("neopywal.lib.compiler")

M.default_options = {
    -- This option allows to use a custom theme palettes for each Neopywal style.
    -- For more information take a look at `https://github.com/RedsXDD/neopywal.nvim#Alternative-Palettes`.
    use_palette = {
        dark = "pywal",
        light = "pywal",
    },

    -- Sets the background color of certain highlight groups to be transparent.
    -- Use this when your terminal opacity is < 1.
    transparent_background = false,

    -- With this option you can create/overwrite any color.
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
        clojure = false,
        cmake = true,
        common_lisp = false,
        css = true,
        dart = false,
        diff = true,
        elixir = false,
        erlang = false,
        git_commit = true,
        go = true,
        haskell = false,
        help = true,
        html = true,
        ini = false,
        java = false,
        javascript = true,
        javascript_react = false,
        json = true,
        kotlin = false,
        latex = false,
        less = false,
        lua = true,
        makefile = true,
        markdown = true,
        matlab = false,
        objectivec = false,
        ocaml = false,
        perl = false,
        php = true,
        powershell = false,
        python = true,
        restructuredtext = false,
        ruby = false,
        rust = true,
        sass = false,
        scala = false,
        shell = true,
        swift = false,
        toml = true,
        typescript = true,
        viml = true,
        xml = false,
        yaml = true,
        zsh = true,
    },
    plugins = {
        aerial = true,
        ale = false,
        alpha = true,
        barbar = false,
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
        dadbod_ui = false,
        dap = false,
        dap_ui = false,
        dashboard = true,
        diffview = false,
        dropbar = {
            enabled = false,
            colored_text = false, -- Whether to add color for kind's texts.
        },
        fern = false,
        flash = {
            enabled = true,
            style = { "bold", "italic" },
        },
        fzf = false,
        git_gutter = true,
        gitsigns = true,
        glyph_palette = false,
        grug_far = false,
        harpoon = false,
        headlines = false,
        hop = {
            enabled = false,
            style = { "bold", "italic" },
        },
        illuminate = {
            enabled = false,
            lsp = true,
            style = { "bold" },
        },
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
        indentmini = {
            enabled = false,

            -- These options either be:
            --   - A color exported by "get_colors()" (e.g.: `color8`)
            --   - A hexadecimal color (e.g.: "#ff0000").
            --   - A function with an optional "C" parameter that returns one of the two options above.
            --     e.g: function(C) return C.color1 end
            scope_color = "",
            current_scope_color = "",
        },
        lazy = true,
        lazygit = true,
        leap = {
            enabled = false,
            style = { "bold", "italic" },
        },
        lir = {
            enabled = false,
            git_status = false,
        },
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
        lspsaga = {
            enabled = false,
            dim_folder = true, -- Whether to dim the folder name on the winbar.
            dim_filename = true, -- Whether to dim the filename on the winbar.
            dim_separator = true, -- Whether to dim the separator character on the winbar.
            winbar_style = { "bold" },
        },
        markdown = false,
        mason = true,
        navbuddy = false,
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
        neogit = false,
        neotest = false,
        neotree = true,
        netrw = true,
        noice = true,
        NormalNvim = false,
        notifier = false,
        notify = true,
        nvim_cmp = true,
        nvimtree = true,
        octo = false,
        overseer = false,
        pounce = {
            enabled = false,
            style = { "bold", "italic" },
        },
        rainbow = false,
        sandwich = false,
        scrollbar = false,
        sneak = {
            enabled = false,
            style = { "bold", "italic" },

            -- Can either be:
            --   - A color exported by "get_colors()" (e.g.: `color8`)
            --   - A hexadecimal color (e.g.: "#ff0000").
            --   - A function with an optional "C" parameter that returns one of the two options above.
            --     e.g: function(C) return C.color1 end
            sneak_color = "",
        },
        surround = false,
        symbols_outline = false,
        telekasten = false,
        telescope = {
            enabled = true,
            -- style = "nvchad",
        },
        treesitter = true,
        trouble = false,
        ts_context = {
            enabled = true,
            dim_background = false,

            -- NOTE: This option only applies to the current context line.
            -- You may want to disable "underline" if you configured the "separator" option within ts_context.
            style = { "underline" },
        },
        ts_rainbow = false,
        ts_rainbow2 = false,
        ufo = true,
        undotree = true,
        vimwiki = false,
        which_key = true,
        window_picker = {
            enabled = false,

            -- Can either be:
            --   - A color exported by "get_colors()" (e.g.: `color8`)
            --   - A hexadecimal color (e.g.: "#ff0000").
            --   - A function with an optional "C" parameter that returns one of the two options above.
            --     e.g: function(C) return C.color1 end
            color = "",
        },
        yanky = false,
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

    -- Handle plugin tables.
    user_config.plugins = check_nil_option(user_config.plugins, {})
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

    -- Coc.nvim depends on lsp highlights.
    if
        M.options.plugins.coc == true
        or type(M.options.plugins.coc) == "table" and M.options.plugins.coc.enabled == true
    then
        if type(M.options.plugins.lsp) == "table" and M.options.plugins.lsp.enabled ~= true then
            M.options.plugins.lsp.enabled = true
        elseif type(M.options.plugins.lsp) == "boolean" and M.options.plugins.lsp ~= true then
            M.options.plugins.lsp = true
        end
    end

    -- Setup new palette configuration.
    Palette.setup({
        use_palette = M.options.use_palette,
        custom_colors = M.options.custom_colors,
    })

    -- Get cached hash.
    local cached_path = Compiler.options.compile_path .. Compiler.options.path_sep .. "cached"
    local file = io.open(cached_path)
    local cached = nil
    if file then
        cached = file:read()
        file:close()
    end

    -- Get current hash.
    local minimal_palette = Palette.get(nil, true)
    local git_path = debug.getinfo(1).source:sub(2, -28) .. ".git"
    local git = vim.fn.getftime(git_path) -- 2x faster vim.loop.fs_stat
    local hash = require("neopywal.lib.hashing").hash({ user_config, minimal_palette })
        .. (git == -1 and git_path or git) -- no .git in /nix/store -> cache path
        .. (vim.o.winblend == 0 and 1 or 0) -- :h winblend
        .. (vim.o.pumblend == 0 and 1 or 0) -- :h pumblend

    -- Recompile if hash changed.
    if cached ~= hash then
        Compiler.compile()
        file = io.open(cached_path, "wb")
        if file then
            file:write(hash)
            file:close()
        end
    end

    M.did_setup = true
end

-- Reference: https://github.com/EdenEast/nightfox.nvim/blob/main/lua/nightfox/lib/collect.lua

local function deep_copy(obj, seen)
    if type(obj) ~= "table" then return obj end
    if seen and seen[obj] then return seen[obj] end

    local s = seen or {}
    local res = {}
    s[obj] = res
    for k, v in pairs(obj) do
        res[deep_copy(k, s)] = deep_copy(v, s)
    end
    return setmetatable(res, getmetatable(obj))
end

function M.reset() M.options = deep_copy(M.default_options) end

return M

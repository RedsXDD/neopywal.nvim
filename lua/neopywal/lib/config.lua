---@type NeopywalConfig
---@diagnostic disable-next-line: missing-fields
local M = {}

M.compiler_opts = {
    file_ext = ".luac",
    filename = "neopywal",
    path_sep = jit and (jit.os == "Windows" and "\\" or "/") or package.config:sub(1, 1),
}
M.compiler_opts.compile_path = vim.fn.stdpath("cache") .. M.compiler_opts.path_sep .. "neopywal"

M.default_options = {
    use_palette = {
        dark = "pywal",
        light = "pywal",
    },
    transparent_background = false,
    dim_inactive = true,
    terminal_colors = true,
    show_end_of_buffer = false,
    show_split_lines = true,
    notify = "all",
    no_italic = false,
    no_bold = false,
    no_underline = false,
    no_undercurl = false,
    no_strikethrough = false,
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
    custom_colors = {},
    custom_highlights = {},
    default_fileformats = true,
    default_plugins = true,
    fileformats = {}, -- setup below with function.
    plugins = {}, -- setup below with function.
}
M.options = M.default_options

---@param enable_default_fileformats boolean|nil
local function setup_fileformats(enable_default_fileformats)
    local enabled_bydefault = (enable_default_fileformats == nil) and M.default_options.default_fileformats
        or enable_default_fileformats

    return {
        c_cpp = enabled_bydefault,
        c_sharp = enabled_bydefault,
        clojure = false,
        cmake = enabled_bydefault,
        common_lisp = false,
        css = enabled_bydefault,
        dart = false,
        diff = enabled_bydefault,
        elixir = false,
        erlang = false,
        git_commit = enabled_bydefault,
        go = enabled_bydefault,
        haskell = false,
        help = enabled_bydefault,
        html = enabled_bydefault,
        ini = false,
        java = false,
        javascript = enabled_bydefault,
        javascript_react = false,
        json = enabled_bydefault,
        kotlin = false,
        latex = false,
        less = false,
        lua = enabled_bydefault,
        makefile = enabled_bydefault,
        markdown = enabled_bydefault,
        matlab = false,
        objectivec = false,
        ocaml = false,
        perl = false,
        php = enabled_bydefault,
        powershell = false,
        python = enabled_bydefault,
        restructuredtext = false,
        ruby = false,
        rust = enabled_bydefault,
        sass = false,
        scala = false,
        shell = enabled_bydefault,
        swift = false,
        toml = enabled_bydefault,
        typescript = enabled_bydefault,
        viml = enabled_bydefault,
        xml = false,
        yaml = enabled_bydefault,
        zsh = enabled_bydefault,
    }
end

---@param enable_default_plugins boolean|nil
local function setup_plugins(enable_default_plugins)
    local enabled_bydefault = (enable_default_plugins == nil) and M.default_options.default_plugins
        or enable_default_plugins

    return {
        aerial = enabled_bydefault,
        ale = false,
        alpha = enabled_bydefault,
        barbar = false,
        beacon = {
            enabled = false,
            color = "",
        },
        blink_cmp = enabled_bydefault,
        coc = false,
        colorful_winsep = {
            enabled = false,
            color = "",
        },
        dadbod_ui = false,
        dap = false,
        dap_ui = false,
        dashboard = enabled_bydefault,
        diffview = false,
        dropbar = {
            enabled = false,
            colored_text = false,
        },
        fern = false,
        flash = {
            enabled = enabled_bydefault,
            style = { "bold", "italic" },
        },
        fzf = false,
        git_gutter = enabled_bydefault,
        gitsigns = enabled_bydefault,
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
            enabled = enabled_bydefault,
            colored_indent_levels = false,
            scope_color = "",
        },
        indentmini = {
            enabled = false,
            scope_color = "",
            current_scope_color = "",
        },
        lazy = enabled_bydefault,
        lazygit = enabled_bydefault,
        leap = {
            enabled = false,
            style = { "bold", "italic" },
        },
        lir = {
            enabled = false,
            git_status = false,
        },
        lsp = {
            enabled = enabled_bydefault,
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
            dim_folder = true,
            dim_filename = true,
            dim_separator = true,
            winbar_style = { "bold" },
        },
        markdown = false,
        mason = enabled_bydefault,
        navbuddy = false,
        navic = {
            enabled = false,
            dim_text = false,
            hide_separator = false,
            text_style = { "bold" },
            bg_color = "",
        },
        neogit = false,
        neotest = false,
        neotree = enabled_bydefault,
        netrw = enabled_bydefault,
        noice = enabled_bydefault,
        NormalNvim = false,
        notifier = false,
        notify = enabled_bydefault,
        nvim_cmp = enabled_bydefault,
        nvimtree = enabled_bydefault,
        octo = false,
        overseer = false,
        pounce = {
            enabled = false,
            style = { "bold", "italic" },
        },
        rainbow = false,
        sandwich = false,
        scrollbar = false,
        snacks = {
            enabled = false,
            scope_color = "",
            current_scope_color = "",
        },
        sneak = {
            enabled = false,
            style = { "bold", "italic" },
            sneak_color = "",
        },
        surround = false,
        symbols_outline = false,
        telekasten = false,
        telescope = {
            enabled = enabled_bydefault,
        },
        todo_comments = {
            enabled = enabled_bydefault,
            style = {
                fix = { "bold", "italic" },
                hack = { "bold", "italic" },
                todo = { "bold", "italic" },
                note = { "bold", "italic" },
                perf = { "bold", "italic" },
                test = { "bold", "italic" },
                warn = { "bold", "italic" },
            },
        },
        treesitter = enabled_bydefault,
        trouble = false,
        ts_context = {
            enabled = enabled_bydefault,
            dim_background = false,
            style = { "underline" },
        },
        ts_rainbow = false,
        ts_rainbow2 = false,
        ufo = enabled_bydefault,
        undotree = enabled_bydefault,
        vimwiki = false,
        which_key = enabled_bydefault,
        window_picker = {
            enabled = false,
            color = "",
        },
        yanky = false,
        mini = {
            animate = enabled_bydefault,
            clue = enabled_bydefault,
            completion = {
                enabled = enabled_bydefault,
                parameter_style = { "underline" },
            },
            cursorword = {
                enabled = enabled_bydefault,
                style = { "underline" },
            },
            deps = enabled_bydefault,
            diff = enabled_bydefault,
            files = enabled_bydefault,
            hipatterns = {
                enabled = enabled_bydefault,
                style = {
                    fixme = { "bold", "italic" },
                    hack = { "bold", "italic" },
                    todo = { "bold", "italic" },
                    note = { "bold", "italic" },
                },
            },
            icons = enabled_bydefault,
            indentscope = {
                enabled = enabled_bydefault,
                scope_color = "",
            },
            jump = {
                enabled = enabled_bydefault,
                style = { "bold", "italic" },
            },
            jump2d = {
                enabled = enabled_bydefault,
                style = { "bold", "italic" },
            },
            map = enabled_bydefault,
            notify = enabled_bydefault,
            operators = enabled_bydefault,
            pick = enabled_bydefault,
            snippets = {
                enabled = enabled_bydefault,
                style = { "underdouble" },
            },
            starter = enabled_bydefault,
            statusline = {
                enabled = enabled_bydefault,
                mode_colors = {
                    normal = "color4",
                    visual = "color5",
                    insert = "color6",
                    command = "color1",
                    replace = "color2",
                    other = "color3",
                },
            },
            surround = enabled_bydefault,
            tabline = enabled_bydefault,
            test = enabled_bydefault,
            trailspace = {
                enabled = enabled_bydefault,
                color = "",
            },
        },
    }
end

M.did_setup = false
---@param user_config? NeopywalOptions
function M.setup(user_config)
    user_config = user_config or {}
    user_config.plugins = user_config.plugins or {}
    M.default_options.plugins = setup_plugins(user_config.default_plugins)

    -- stylua: ignore start
    -- Disable fileformats if treesitter is enabled (unless the user manually specifies otherwise).
    local user_enabled_fileformats = user_config.default_fileformats
    local treesitter_enabled = (user_config.plugins.treesitter == nil) and M.default_options.plugins.treesitter or user_config.plugins.treesitter
    local fileformats_are_enabled = (user_enabled_fileformats == nil) and not treesitter_enabled or user_enabled_fileformats
    -- stylua: ignore end

    M.default_options.default_fileformats = fileformats_are_enabled
    M.default_options.fileformats = setup_fileformats(fileformats_are_enabled)

    -- Create the final configuration table.
    ---@diagnostic disable-next-line: assign-type-mismatch
    M.options = vim.tbl_deep_extend("keep", user_config, M.default_options)

    -- Neovide doesn't play well with transparent background colors.
    if vim.g.neovide then M.options.transparent_background = false end

    -- Validate M.options.notifier to be one of it's proper values.
    local validated_notify = false
    for _, v in pairs({ "all", "warn", "error", "none" }) do
        if M.options.notify == v then validated_notify = true end
    end

    if not validated_notify then
        local Notify = require("neopywal.utils.notify")
        local old_notify_opt = M.options.notify
        M.options.notify = "all"
        Notify.error([[
Invalid `require("neopywal").setup({ notify = "]] .. old_notify_opt .. [[" })` configuration,
make sure it's one of "all", "warn", "error" or "none".]])
    end

    -- Coc.nvim depends on lsp highlights.
    local coc = M.options.plugins.coc
    local lsp = M.options.plugins.lsp
    local coc_is_enabled = coc == true or type(coc) == "table" and coc.enabled == true
    if coc_is_enabled then
        if type(lsp) == "boolean" and lsp ~= true then
            lsp = true
        elseif type(lsp) == "table" and lsp.enabled ~= true then
            lsp.enabled = true
        end
    end

    -- Setup new palette configuration.
    local Palette = require("neopywal.lib.palette")
    Palette.setup({
        use_palette = M.options.use_palette,
        custom_colors = M.options.custom_colors,
    })

    -- Get cached hash.
    local cached_path = M.compiler_opts.compile_path .. M.compiler_opts.path_sep .. "cached"
    local file = io.open(cached_path)
    local cached = nil
    if file then
        cached = file:read()
        file:close()
    end

    -- Get current hash.
    local minimal_palette = Palette.get_minpalette()
    local git_path = debug.getinfo(1).source:sub(2, -28) .. ".git"
    local git = vim.fn.getftime(git_path) -- 2x faster vim.loop.fs_stat
    local hash = require("neopywal.lib.hashing").hash({ user_config, minimal_palette })
        .. (git == -1 and git_path or git) -- no .git in /nix/store -> cache path
        .. (vim.o.winblend == 0 and 1 or 0) -- :h winblend
        .. (vim.o.pumblend == 0 and 1 or 0) -- :h pumblend
        .. (vim.g.neovide ~= nil and 1 or 0) -- This is needed to avoid Neopywal running inside Neovide with an older terminal cache.

    -- Recompile if hash changed.
    if cached ~= hash then
        local Compiler = require("neopywal.lib.compiler")
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

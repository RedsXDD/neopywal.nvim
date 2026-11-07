---@class Neopywal
local M = {}
local Config = require("neopywal.lib.config")
M.setup = Config.setup

---@return Neopywal.palette
---@param theme_style? NeopywalAlias.theme_styles
---@param minimal_palette? boolean
---@param extra_colors? Neopywal.lib.config.options.custom_colors | fun(C?: table<NeopywalAlias.valid_colors[]>): { [string]: string }
function M.get_colors(theme_style, minimal_palette, extra_colors)
    local Palette = require("neopywal.lib.palette")
    return Palette.get(theme_style, minimal_palette, extra_colors) --[[@as Neopywal.palette]]
end

local lock = false -- Avoid g:colors_name reloading
local did_load = false
local did_commands = false
---@param theme_style? NeopywalAlias.theme_styles
function M.load(theme_style)
    if lock then return end
    if not Config.did_setup then Config.setup() end
    if did_load then
        for name, _ in pairs(package.loaded) do
            if
                name:match("^neopywal.") and not name:match("^neopywal.lib.")
            then
                package.loaded[name] = nil
            end
        end
    end

    local bg = vim.o.background
    theme_style = (theme_style ~= "dark" and theme_style ~= "light") and bg
        or theme_style
    if theme_style ~= bg then
        if vim.g.colors_name == "neopywal-" .. theme_style then
            theme_style = (bg == "light" and theme_style == "dark") and "light"
                or "dark"
        else
            vim.o.background = theme_style
        end
    end

    local filename = Config.compiler_opts.filename
        .. "-"
        .. theme_style
        .. Config.compiler_opts.file_ext
    local compiled_path = Config.compiler_opts.compile_path
        .. Config.compiler_opts.path_sep
        .. filename

    lock = true
    local f = loadfile(compiled_path)
    if not f then
        require("neopywal.lib.compiler").compile()
        f = assert(loadfile(compiled_path), "could not load neopywal cache.")
    end
    f()
    lock = false

    -- Lazy load commands and reloader.
    local timeout = 1000
    vim.defer_fn(function()
        -- Initialize live reloading on template file changes.
        if not vim.g.neopywal_disable_reloader then
            require("neopywal.lib.reloader").init()
        end
        if not did_commands then
            did_commands = true
            vim.api.nvim_create_user_command(
                "NeopywalCompile",
                function() require("neopywal.lib.compiler").recompile() end,
                {}
            )
            vim.api.nvim_create_user_command(
                "NeopywalInteractive",
                function() require("neopywal.lib.interactive").toggle() end,
                {}
            )
        end
    end, timeout)

    did_load = true
end

return M

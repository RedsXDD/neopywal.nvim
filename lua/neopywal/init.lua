---@type Neopywal
---@diagnostic disable-next-line: missing-fields
local M = {}
local Compiler = require("neopywal.lib.compiler")
local Palette = require("neopywal.lib.palette")
local Config = require("neopywal.lib.config")
M.setup = Config.setup
M.get_colors = Palette.get_colors

local lock = false -- Avoid g:colors_name reloading
local did_load = false
---@param theme_style? ThemeStyles
function M.load(theme_style)
    if lock then return end
    if not Config.did_setup then Config.setup() end
    if did_load then
        for name, _ in pairs(package.loaded) do
            if name:match("^neopywal.") and not name:match("^neopywal.lib.") then package.loaded[name] = nil end
        end
    end

    local bg = vim.o.background
    theme_style = (theme_style ~= "dark" and theme_style ~= "light") and bg or theme_style
    if theme_style ~= bg then
        if vim.g.colors_name == "neopywal-" .. theme_style then
            theme_style = (bg == "light" and theme_style == "dark") and "light" or "dark"
        else
            vim.o.background = theme_style
        end
    end

    local filename = Compiler.options.filename .. "-" .. theme_style
    local compiled_path = Compiler.options.compile_path .. Compiler.options.path_sep .. filename

    lock = true
    local f = loadfile(compiled_path)
    if not f then
        Compiler.compile()
        f = assert(loadfile(compiled_path), "could not load neopywal cache.")
    end
    f()
    lock = false

    -- Initialize live reloading on template file changes.
    vim.schedule(function() require("neopywal.lib.reloader").init() end)

    did_load = true
end

vim.api.nvim_create_user_command("NeopywalCompile", function() require("neopywal.lib.compiler").recompile() end, {})

return M

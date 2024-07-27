---@type Neopywal
---@diagnostic disable-next-line: missing-fields
local M = {}
local compiler = require("neopywal.lib.compiler")
local palette = require("neopywal.lib.palette")
local config = require("neopywal.lib.config")
local G = config.compiler
M.setup = config.setup
M.get_colors = palette.get_colors

local lock = false -- Avoid g:colors_name reloading
local did_load = false
---@param theme_style? ThemeStyles
function M.load(theme_style)
    if lock then return end
    if not config.did_setup then config.setup() end
    if did_load then require("neopywal.lib.reload").reset() end

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

    -- Initialize live reloading on template file changes.
    vim.schedule(function() require("neopywal.lib.reload").init() end)

    did_load = true
end

vim.api.nvim_create_user_command("NeopywalCompile", function() require("neopywal.lib.reload").recompile() end, {})

return M

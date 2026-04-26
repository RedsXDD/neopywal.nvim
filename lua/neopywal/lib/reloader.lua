local M = {}

local did_augroups = false
---@param name string
local function augroup(name) return vim.api.nvim_create_augroup("neopywal_" .. name, { clear = true }) end

---@return function
---@param schedule boolean
---@param callback function
local function setup_callback(schedule, callback)
    local c = function()
        if not vim.g.colors_name:match("^neopywal") then return end
        callback()
    end

    local s = function()
        if not vim.g.colors_name:match("^neopywal") then return end
        vim.schedule(callback)
    end

    return schedule and s or c
end

local function augroups()
    if not vim.g.neopywal_debug then return end
    vim.api.nvim_create_autocmd("BufWritePost", {
        desc = "Source neopywal *.lua files for debug.",
        group = augroup("debug_resource_files"),
        pattern = { "*/neopywal/*", "*/neopywal.lua" },
        callback = setup_callback(true, function() require("neopywal.lib.compiler").recompile() end),
    })
end

M.lock = { dark = false, light = false }
local function init(theme_style, template_path)
    if not theme_style or theme_style ~= "dark" and theme_style ~= "light" then theme_style = vim.o.background end
    if M.lock[theme_style] then return end
    M.lock[theme_style] = true

    vim.uv = vim.uv or vim.loop -- luv binding in 0.9 and 0.10 onwards.
    local event = vim.uv.new_fs_event()
    if event == nil then
        local Notify = require("neopywal.utils.notify")
        Notify.error("Failed to start Neopywal's reloader event ...")
        return
    end

    event:start(template_path, {
        watch_entry = true,
        stat = true,
    }, function(err)
        if err then
            local Notify = require("neopywal.utils.notify")
            local compiler_opts = require("neopywal.lib.config").compiler_opts
            local err_path = (compiler_opts.path_sep == "/" and "/tmp" or os.getenv("TMP"))
                .. compiler_opts.path_sep
                .. "neopywal_reload_error.lua"
            Notify.error(string.format(
                [[
An error occurred when trying to reload the colorscheme with the "%s" template file.
You can open %s for debugging

If you think this is a bug, kindly open an issue and attach %s file
Below is the error message that we captured:
%s]],
                template_path,
                err_path,
                err_path,
                err
            ))

            local err_file = io.open(err_path, "wb")
            if err_file then
                err_file:write(err)
                err_file:close()
            end
            event:stop()
        end

        vim.schedule(function()
            if not vim.g.colors_name:match("^neopywal") then
                event:stop()
                M.lock[theme_style] = false
                package.loaded["neopywal.lib.reloader"] = nil
                return
            end

            local fetched_theme_style = theme_style
            local current_theme_style = vim.o.background
            if M.both == true or fetched_theme_style == current_theme_style then
                local Notify = require("neopywal.utils.notify")
                Notify.info(string.format(
                    [[
Change detected in template file
"%s"
for the "%s" theme style,
recompiling colorscheme ...]],
                    template_path,
                    current_theme_style
                ))
            end
            require("neopywal.lib.compiler").recompile(false)
        end)
    end)
end

M.both = false
function M.init()
    if not did_augroups then augroups() end
    local Palette = require("neopywal.lib.palette")
    if not Palette.did_setup then Palette.setup() end

    -- We really don't need two separate events for the same file.
    if Palette.palette_metadata.dark.filepath == Palette.palette_metadata.light.filepath then
        M.both = true
        init("dark", Palette.palette_metadata.dark.filepath)
        return
    end

    local template_path = ""
    for _, theme_style in pairs({ "dark", "light" }) do
        local metadata = Palette.palette_metadata[theme_style]
        if metadata.file_exists and not metadata.is_requireable then
            template_path = metadata.filepath
            init(theme_style, template_path)
        end
    end
end

return M

local M = {}

---@param theme_style? ThemeStyles
function M.get(theme_style)
    local theme = {}

    local _O, _C, _U = O, C, U -- Borrowing global variables (setfenv doesn't work with require)
    O = require("neopywal.lib.config").options
    C = require("neopywal.lib.palette").get_colors(theme_style)
    U = require("neopywal.utils.color")

    -- Get highlights for enabled fileformats.
    local fileformats = {}
    for fileformat, option in pairs(O.fileformats) do
        if option == true or type(option) == "table" and option.enabled then
            local default_config = require("neopywal.lib.config").default_options.fileformats[fileformat]
            O.fileformats[fileformat] = type(default_config) == "table" and default_config or {}
            O.fileformats[fileformat].enabled = true
            fileformats = vim.tbl_deep_extend("force", fileformats, require("neopywal.theme.fileformats")[fileformat]())
        end
    end

    -- Get highlights for enabled plugins.
    local plugins = {}
    local function load_plugin(plugin, is_mini)
        local option = is_mini and O.plugins.mini[plugin] or O.plugins[plugin]
        local default_config = is_mini and require("neopywal.lib.config").default_options.plugins.mini[plugin]
            or require("neopywal.lib.config").default_options.plugins[plugin]

        local apply = false
        if type(option) == "table" and option.enabled then
            apply = true
        elseif option == true then
            if is_mini == false then
                O.plugins[plugin] = type(default_config) == "table" and default_config or {}
                O.plugins[plugin].enabled = true
            else
                O.plugins.mini[plugin] = type(default_config) == "table" and default_config or {}
                O.plugins.mini[plugin].enabled = true
            end
            apply = true
        end

        if apply then
            local plugin_name = is_mini and "mini." .. plugin or plugin
            plugins = vim.tbl_deep_extend("force", plugins, require("neopywal.theme.plugins." .. plugin_name).get())
        end
    end

    for plugin in pairs(O.plugins) do
        if plugin == "mini" then
            for mini_plugin in pairs(O.plugins.mini) do
                load_plugin(mini_plugin, true)
            end
        else
            load_plugin(plugin, false)
        end
    end

    -- Get user-defined highlights.
    local user_highlights = O.custom_highlights
    if type(user_highlights) == "function" then user_highlights = user_highlights(C) end

    -- This section MUST happen AFTER all the manipulation on the "O" table has been done.
    theme.editor = require("neopywal.theme.editor").get()
    theme.terminal = require("neopywal.theme.terminal").get()
    theme.fileformats = fileformats
    theme.plugins = plugins
    theme.custom_highlights = user_highlights

    O, C, U = _O, _C, _U -- Returning global variables

    return theme
end

return M

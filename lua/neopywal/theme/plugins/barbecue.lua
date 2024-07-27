---@type NeopywalPluginsBarbecue
---@diagnostic disable-next-line: missing-fields
local M = {}
local O = require("neopywal.lib.config").options
local C = require("neopywal").get_colors()

M.default_options = {
    dim_background = false, -- Whether to dim the background.
    dim_context = true, -- Whether the context should be dimmed.
    dim_dirname = true, -- Whether the directory name should be dimmed.
    hide_separator = false, -- Whether to hide the separator character.
    basename_style = { "bold", "italic" },
    context_style = {},
    dirname_style = {},

    -- With this option you can overwrite any of the groups from the builtin theme.
    -- For more information take a look at `:h barbecue-recipes` and at
    -- `https://github.com/RedsXDD/neopywal.nvim#Customizing-Highlights`
    -- as this option works exactly the same as `custom_highlights`.
    theme = {},
}
M.options = M.default_options

local did_setup = false
---@param user_config NeopywalPluginsBarbecueOptions?
function M.setup(user_config)
    user_config = user_config or {}

    -- Get user-defined theme.
    local user_theme = user_config.theme or {}
    if type(user_theme) == "function" then user_theme = user_theme(C) end
    user_config.theme = user_theme

    M.options = vim.tbl_deep_extend("keep", user_config, M.default_options)
    did_setup = true
end

function M.get()
    if not did_setup then M.setup() end

    local kinds = require("neopywal.utils.kinds").get()
    local context_color = M.options.dim_context and C.color8 or C.foreground
    local dirname_color = M.options.dim_dirname and C.color8 or C.foreground
    local background_color = O.transparent_background and C.none
        or M.options.dim_background and C.dim_bg
        or C.background

    local default_theme = {
        normal = { fg = C.foreground, bg = background_color },

        ellipsis = { fg = background_color },
        modified = { fg = C.diff_changed },
        separator = { bg = background_color, fg = M.options.hide_separator and background_color or context_color },

        context = { fg = context_color, styles = M.options.context_style or {} },
        dirname = { fg = dirname_color, styles = M.options.dirname_style or {} },
        basename = { fg = C.foreground, styles = M.options.basename_style or {} },

        context_array = kinds.Array,
        context_boolean = kinds.Boolean,
        context_class = kinds.Class,
        context_constant = kinds.Constant,
        context_constructor = kinds.Constructor,
        context_enum = kinds.Enum,
        context_enum_member = kinds.EnumMember,
        context_event = kinds.Event,
        context_field = kinds.Field,
        context_file = kinds.File,
        context_function = kinds.Function,
        context_interface = kinds.Interface,
        context_key = kinds.Key,
        context_method = kinds.Method,
        context_module = kinds.Module,
        context_namespace = kinds.Namespace,
        context_null = kinds.Null,
        context_number = kinds.Number,
        context_object = kinds.Object,
        context_operator = kinds.Operator,
        context_package = kinds.Package,
        context_property = kinds.Property,
        context_string = kinds.String,
        context_struct = kinds.Struct,
        context_type_parameter = kinds.TypeParameter,
        context_variable = kinds.Variable,
    }

    local final_theme = vim.tbl_deep_extend("keep", M.options.theme, default_theme)
    for _, properties in pairs(final_theme) do
        if properties.styles then
            for _, style in pairs(properties.styles) do
                properties[style] = true
                if O.no_italic and style == "italic" then properties[style] = false end
                if O.no_bold and style == "bold" then properties[style] = false end
                if O.no_underline and style == "underline" then properties[style] = false end
                if O.no_undercurl and style == "undercurl" then properties[style] = false end
                if O.no_strikethrough and style == "strikethrough" then properties[style] = false end
            end
        end
        properties.styles = nil
    end
    M.options.theme = final_theme

    return M.options.theme
end

return M

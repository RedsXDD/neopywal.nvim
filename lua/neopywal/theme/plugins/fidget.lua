local M = {}

---@param user_hightlights NeopywalPluginsFidgetGroups?
function M.setup(user_hightlights)
    local O = require("neopywal.lib.config").options
    local C = require("neopywal.lib.palette").get()

    user_hightlights = user_hightlights or {}

    local bg = O.transparent_background and C.none or C.dim_bg
    local default_highlights = {
        FidgetDone = { bg = bg, fg = C.ok, styles = { "bold", "italic" } },
        FidgetGroup = { bg = bg, fg = C.foreground, styles = { "bold", "italic" } },
        FidgetIcon = { bg = bg, fg = C.color4, styles = { "bold", "italic" } },
        FidgetNormal = { bg = bg, fg = C.comment, styles = { "bold", "italic" } },
        FidgetProgress = { bg = bg, fg = C.color3, styles = { "bold", "italic" } },
        FidgetSeparator = { bg = bg, fg = C.comment, styles = { "bold", "italic" } },
    }
    local highlights = vim.tbl_deep_extend("keep", user_hightlights, default_highlights)

    for group, properties in pairs(highlights) do
        -- You can argue whether this line is needed or not, i just added it to prevent the user
        -- from using the setup() function to create arbitrary highlights groups.
        if not default_highlights[group] then goto continue end

        if properties.styles then
            for _, style in pairs(properties.styles) do
                properties[style] = true
                if O.no_italic and style == "italic" then properties[style] = false end
                if O.no_bold and style == "bold" then properties[style] = false end
                if O.no_underline and style == "underline" then properties[style] = false end
                if O.no_undercurl and style == "undercurl" then properties[style] = false end
                if O.no_strikethrough and style == "strikethrough" then properties[style] = false end
                properties[style] = properties[style]
            end
        end
        properties.styles = nil
        vim.api.nvim_set_hl(0, group, properties)

        ::continue::
    end
end

return M

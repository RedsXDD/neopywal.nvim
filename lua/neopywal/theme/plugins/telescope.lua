local M = {}

function M.get()
    return O.plugins.telescope.style ~= nil
            and string.lower(O.plugins.telescope.style) == "nvchad"
            and not O.transparent_background
            and {
                TelescopeBorder = {
                    bg = O.dim_inactive and C.background or U.blend(C.background, "#000000", 0.8),
                    fg = O.dim_inactive and C.background or U.blend(C.background, "#000000", 0.8),
                },
                TelescopeNormal = {
                    bg = O.dim_inactive and C.background or U.blend(C.background, "#000000", 0.8),
                },
                TelescopePromptBorder = {
                    bg = C.cursorline,
                    fg = C.cursorline,
                },
                TelescopePromptNormal = {
                    bg = C.cursorline,
                    fg = C.foreground,
                },
                TelescopePromptCounter = { fg = C.foreground },
                TelescopePromptPrefix = {
                    bg = C.cursorline,
                    fg = C.color4,
                    styles = { "bold" },
                },
                TelescopePreviewTitle = {
                    bg = C.color3,
                    fg = C.background,
                },
                TelescopePromptTitle = {
                    bg = C.color4,
                    fg = C.background,
                },
                TelescopeResultsTitle = {
                    bg = C.color6,
                    fg = C.background,
                },
                TelescopeSelection = { link = "CursorLine" },
                TelescopeSelectionCaret = { bg = C.cursorline, fg = C.color6 },
            }
        or {
            TelescopeSelection = { link = "CursorLine" },
            TelescopePromptBorder = { link = "TelescopeBorder" },
            TelescopePromptPrefix = { fg = C.color4, styles = { "bold" } },
            TelescopePreviewTitle = { fg = C.color3 },
            TelescopePromptTitle = { fg = C.color4 },
            TelescopeResultsTitle = { fg = C.color6 },
            TelescopeSelectionCaret = { bg = C.cursorline, fg = C.color6 },
        }
end

return M

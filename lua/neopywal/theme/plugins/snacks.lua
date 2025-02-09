local M = {}

function M.get()
    local scope_color = O.plugins.snacks.scope_color
    if type(scope_color) == "function" then scope_color = scope_color(C) end
    scope_color = require("neopywal.utils.color").validate(scope_color, C.comment)

    local current_scope_color = O.plugins.snacks.current_scope_color
    if type(current_scope_color) == "function" then current_scope_color = current_scope_color(C) end
    current_scope_color = require("neopywal.utils.color").validate(current_scope_color, C.color4)

    local hl = {
        -- General.
        SnacksNormalNC = { link = "NormalNC" },
        SnacksWinBar = { link = "FloatTitle" },
        SnacksWinBarNC = { fg = C.comment },
        SnacksZenIcon = { fg = C.color4 },
        SnacksScratchDesc = { bg = U.blend(C.foreground, C.background, 0.2), fg = C.foreground, styles = { "bold" } },
        SnacksScratchKey = { bg = U.blend(C.color2, C.background, 0.2), fg = C.color2, styles = { "bold" } },
        SnacksIndent = { fg = scope_color, styles = { "nocombine" } },
        SnacksIndentScope = { fg = current_scope_color, styles = { "nocombine" } },

        -- Input.
        -- SnacksBackdrop = {},
        SnacksInputIcon = { fg = C.foreground },
        SnacksInputBorder = { link = "SnacksInputIcon" },
        SnacksInputTitle = { fg = C.foreground, styles = { "bold" } },

        -- Profiler.
        SnacksProfilerIconInfo = { bg = U.blend(C.foreground, C.background, 0.2), fg = C.foreground },
        SnacksProfilerBadgeInfo = { bg = U.blend(C.foreground, C.background, 0.1), fg = C.foreground },

        -- Dashboard.
        SnacksDashboardDesc = { fg = C.foreground },
        SnacksDashboardDir = { fg = C.comment },
        SnacksDashboardFile = { fg = C.color6, styles = { "bold" } },
        SnacksDashboardFooter = { fg = C.color4, styles = { "bold" } },
        SnacksDashboardHeader = { fg = C.color4, styles = { "bold" } },
        SnacksDashboardIcon = { fg = C.color4 },
        SnacksDashboardKey = { fg = C.color1, styles = { "bold" } },
        SnacksDashboardSpecial = { fg = C.color5, styles = { "bold" } },
        SnacksDashboardTerminal = { fg = C.error, styles = { "bold" } },
        SnacksDashboardTitle = { fg = C.color4, styles = { "bold" } },

        -- Notifier.
        SnacksNotifierInfo = { fg = C.info },
        SnacksNotifierIconInfo = { link = "SnacksNotifierInfo" },
        SnacksNotifierTitleInfo = { fg = C.info, styles = { "italic" } },
        SnacksNotifierBorderInfo = { link = "SnacksNotifierInfo" },
        SnacksNotifierFooterInfo = { link = "DiagnosticInfo" },

        SnacksNotifierWarn = { fg = C.warn },
        SnacksNotifierIconWarn = { link = "SnacksNotifierWarn" },
        SnacksNotifierTitleWarn = { fg = C.warn, styles = { "italic" } },
        SnacksNotifierBorderWarn = { link = "SnacksNotifierWarn" },
        SnacksNotifierFooterWarn = { link = "DiagnosticWarn" },

        SnacksNotifierError = { fg = C.error },
        SnacksNotifierIconError = { link = "SnacksNotifierError" },
        SnacksNotifierTitleError = { fg = C.error, styles = { "italic" } },
        SnacksNotifierBorderError = { link = "SnacksNotifierError" },
        SnacksNotifierFooterError = { link = "DiagnosticError" },

        SnacksNotifierTrace = { fg = C.hint },
        SnacksNotifierIconTrace = { link = "SnacksNotifierTrace" },
        SnacksNotifierTitleTrace = { fg = C.hint, styles = { "italic" } },
        SnacksNotifierBorderTrace = { link = "SnacksNotifierTrace" },
        SnacksNotifierFooterTrace = { link = "DiagnosticHint" },

        SnacksNotifierDebug = { fg = C.unnecessary },
        SnacksNotifierIconDebug = { link = "SnacksNotifierDebug" },
        SnacksNotifierTitleDebug = { fg = C.unnecessary, styles = { "italic" } },
        SnacksNotifierBorderDebug = { link = "SnacksNotifierDebug" },
        SnacksNotifierFooterDebug = { link = "DiagnosticUnnecessary" },
    }

    for i, color in ipairs(require("neopywal.utils.rainbow").get()) do
        hl["SnacksIndent" .. i] = { fg = color, styles = { "nocombine" } }
    end

    return hl
end

return M

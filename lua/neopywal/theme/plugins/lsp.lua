local M = {}

function M.get()
    local virtual_text = O.plugins.lsp.virtual_text
    local underlines = O.plugins.lsp.underlines
    local inlay_hints = O.plugins.lsp.inlay_hints
    local darkening_percentage = 0.2

    return {
        -- These groups are for the native LSP client. Some other LSP clients may
        -- use these groups, or use their own. Consult your LSP client's documentation.

        LspInfoBorder = { link = "FloatBorder" }, -- LspInfo border
        LspCodeLens = { fg = C.comment }, -- virtual text of the codelens
        LspCodeLensSeparator = { link = "LspCodeLens" }, -- virtual text of the codelens separators
        LspInlayHint = {
            bg = (O.transparent_background or not inlay_hints.background) and C.none
                or U.blend(C.inlay_hints, C.background, darkening_percentage),
            fg = U.blend(C.inlay_hints, C.foreground, 0.7),
            styles = inlay_hints.style or {},
        }, -- Virtual text of the inlay hints.

        LspReferenceText = {
            bg = U.blend(C.background, C.foreground, darkening_percentage),
            styles = { "bold" },
        }, -- used for highlighting "text" references
        LspReferenceRead = {
            bg = U.blend(C.background, C.foreground, darkening_percentage),
            styles = { "bold" },
        }, -- used for highlighting "read" references
        LspReferenceWrite = {
            bg = U.blend(C.background, C.foreground, darkening_percentage),
            styles = { "bold" },
        }, -- used for highlighting "write" references

        LspDiagnosticsDefaultError = { link = "DiagnosticError" }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        LspDiagnosticsDefaultWarning = { link = "DiagnosticWarn" }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        LspDiagnosticsDefaultInformation = { link = "DiagnosticInfo" }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        LspDiagnosticsDefaultHint = { link = "DiagnosticHint" }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

        LspDiagnosticsHint = { link = "DiagnosticHint" },
        LspDiagnosticsInformation = { link = "DiagnosticInfo" },
        LspDiagnosticsWarning = { link = "DiagnosticWarn" },
        LspDiagnosticsError = { link = "DiagnosticError" },

        -- LspDiagnosticsFloatingError         = { }, -- Used to color "Error" diagnostic messages in diagnostics float
        -- LspDiagnosticsFloatingWarning       = { }, -- Used to color "Warning" diagnostic messages in diagnostics float
        -- LspDiagnosticsFloatingInformation   = { }, -- Used to color "Information" diagnostic messages in diagnostics float
        -- LspDiagnosticsFloatingHint          = { }, -- Used to color "Hint" diagnostic messages in diagnostics float

        LspDiagnosticsVirtualTextError = { link = "DiagnosticError" }, -- Used for "Error" diagnostic virtual text
        LspDiagnosticsVirtualTextWarning = { link = "DiagnosticWarn" }, -- Used for "Warning" diagnostic virtual text
        LspDiagnosticsVirtualTextInformation = { link = "DiagnosticInfo" }, -- Used for "Information" diagnostic virtual text
        LspDiagnosticsVirtualTextHint = { link = "DiagnosticHint" }, -- Used for "Hint" diagnostic virtual text

        LspDiagnosticsUnderlineError = { sp = C.error, styles = underlines.errors or {} }, -- Used to underline "Error" diagnostics
        LspDiagnosticsUnderlineWarning = { sp = C.warn, styles = underlines.warnings or {} }, -- Used to underline "Warning" diagnostics
        LspDiagnosticsUnderlineInformation = { sp = C.info, styles = underlines.information or {} }, -- Used to underline "Information" diagnostics
        LspDiagnosticsUnderlineHint = { sp = C.hint, styles = underlines.hints or {} }, -- Used to underline "Hint" diagnostics

        DiagnosticUnderlineOk = { sp = C.ok, styles = underlines.ok or {} }, -- Used to underline "Ok" diagnostics
        DiagnosticUnderlineError = { sp = C.error, styles = underlines.errors or {} }, -- Used to underline "Error" diagnostics
        DiagnosticUnderlineWarn = { sp = C.warn, styles = underlines.warnings or {} }, -- Used to underline "Warning" diagnostics
        DiagnosticUnderlineInfo = { sp = C.info, styles = underlines.information or {} }, -- Used to underline "Information" diagnostics
        DiagnosticUnderlineHint = { sp = C.hint, styles = underlines.hints or {} }, -- Used to underline "Hint" diagnostics

        DiagnosticFloatingOk = { link = "DiagnosticOk" }, -- Used to color "Ok" diagnostic messages in diagnostics float
        DiagnosticFloatingError = { link = "DiagnosticError" }, -- Used to color "Error" diagnostic messages in diagnostics float
        DiagnosticFloatingWarn = { link = "DiagnosticWarn" }, -- Used to color "Warn" diagnostic messages in diagnostics float
        DiagnosticFloatingInfo = { link = "DiagnosticInfo" }, -- Used to color "Info" diagnostic messages in diagnostics float
        DiagnosticFloatingHint = { link = "DiagnosticHint" }, -- Used to color "Hint" diagnostic messages in diagnostics float

        DiagnosticSignOk = { link = "DiagnosticOk" }, -- Used for "Ok" signs in sign column
        DiagnosticSignError = { link = "DiagnosticError" }, -- Used for "Error" signs in sign column
        DiagnosticSignWarn = { link = "DiagnosticWarn" }, -- Used for "Warn" signs in sign column
        DiagnosticSignInfo = { link = "DiagnosticInfo" }, -- Used for "Info" signs in sign column
        DiagnosticSignHint = { link = "DiagnosticHint" }, -- Used for "Hint" signs in sign column

        DiagnosticVirtualTextOk = {
            bg = U.blend(C.ok, C.background, darkening_percentage),
            fg = C.ok,
            styles = virtual_text.ok or {},
        }, -- Used for "Ok" diagnostic virtual text
        DiagnosticVirtualTextError = {
            bg = U.blend(C.error, C.background, darkening_percentage),
            fg = C.error,
            styles = virtual_text.errors or {},
        }, -- Used for "Error" diagnostic virtual text
        DiagnosticVirtualTextWarn = {
            bg = U.blend(C.warn, C.background, darkening_percentage),
            fg = C.warn,
            styles = virtual_text.warnings or {},
        }, -- Used for "Warning" diagnostic virtual text
        DiagnosticVirtualTextInfo = {
            bg = U.blend(C.info, C.background, darkening_percentage),
            fg = C.info,
            styles = virtual_text.information or {},
        }, -- Used for "Information" diagnostic virtual text
        DiagnosticVirtualTextHint = {
            bg = U.blend(C.hint, C.background, darkening_percentage),
            fg = C.hint,
            styles = virtual_text.hints or {},
        }, -- Used for "Hint" diagnostic virtual text
    }
end

return M

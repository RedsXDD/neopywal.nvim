local M = {}

function M.get()
	-- neovim/nvim-lspconfig
	local virtual_text = O.styles.lsp.virtual_text
	local underlines = O.styles.lsp.underlines
	local inlay_hints = O.styles.lsp.inlay_hints
	local darkening_percentage = 0.2

	return {
		-- These groups are for the native LSP client. Some other LSP clients may
		-- use these groups, or use their own. Consult your LSP client's documentation.

		LspInfoBorder = { link = "FloatBorder" }, -- LspInfo border
		LspCodeLens = { link = "Comment" }, -- virtual text of the codelens
		LspCodeLensSeparator = { link = "LspCodeLens" }, -- virtual text of the codelens separators
		LspInlayHint = {
			bg = (O.transparent_background or not inlay_hints.background) and C.none
				or U.blend(C.color8, C.background, darkening_percentage),
			fg = U.blend(C.color8, C.foreground, 0.7),
		}, -- Virtual text of the inlay hints.

		LspReferenceText = { bg = U.blend(C.background, C.foreground, darkening_percentage), styles = { "bold" } }, -- used for highlighting "text" references
		LspReferenceRead = { bg = U.blend(C.background, C.foreground, darkening_percentage), styles = { "bold" } }, -- used for highlighting "read" references
		LspReferenceWrite = { bg = U.blend(C.background, C.foreground, darkening_percentage), styles = { "bold" } }, -- used for highlighting "write" references

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

		LspDiagnosticsVirtualTextError = { fg = C.color1, styles = virtual_text.errors or {} }, -- Used for "Error" diagnostic virtual text
		LspDiagnosticsVirtualTextWarning = {
			fg = U.blend(C.color1, C.color3, 0.5),
			styles = virtual_text.warnings or {},
		}, -- Used for "Warning" diagnostic virtual text
		LspDiagnosticsVirtualTextInformation = { fg = C.foreground, styles = virtual_text.information or {} }, -- Used for "Information" diagnostic virtual text
		LspDiagnosticsVirtualTextHint = { fg = C.color6, styles = virtual_text.hints or {} }, -- Used for "Hint" diagnostic virtual text

		LspDiagnosticsUnderlineError = { sp = C.color1, styles = underlines.errors or {} }, -- Used to underline "Error" diagnostics
		LspDiagnosticsUnderlineWarning = { sp = U.blend(C.color1, C.color3, 0.5), styles = underlines.warnings or {} }, -- Used to underline "Warning" diagnostics
		LspDiagnosticsUnderlineInformation = { sp = C.foreground, styles = underlines.information or {} }, -- Used to underline "Information" diagnostics
		LspDiagnosticsUnderlineHint = { sp = C.color6, styles = underlines.hints or {} }, -- Used to underline "Hint" diagnostics

		DiagnosticUnderlineOk = { sp = C.color2, styles = underlines.ok or {} }, -- Used to underline "Ok" diagnostics
		DiagnosticUnderlineError = { sp = C.color1, styles = underlines.errors or {} }, -- Used to underline "Error" diagnostics
		DiagnosticUnderlineWarn = { sp = U.blend(C.color1, C.color3, 0.5), styles = underlines.warnings or {} }, -- Used to underline "Warning" diagnostics
		DiagnosticUnderlineInfo = { sp = C.foreground, styles = underlines.information or {} }, -- Used to underline "Information" diagnostics
		DiagnosticUnderlineHint = { sp = C.color6, styles = underlines.hints or {} }, -- Used to underline "Hint" diagnostics

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
			bg = U.blend(C.color2, C.background, darkening_percentage),
			fg = C.color2,
			styles = virtual_text.ok or {},
		}, -- Used for "Ok" diagnostic virtual text
		DiagnosticVirtualTextError = {
			bg = U.blend(C.color1, C.background, darkening_percentage),
			fg = C.color1,
			styles = virtual_text.errors or {},
		}, -- Used for "Error" diagnostic virtual text
		DiagnosticVirtualTextWarn = {
			bg = U.blend(U.blend(C.color1, C.color3, 0.5), C.background, darkening_percentage),
			fg = U.blend(C.color1, C.color3, 0.5),
			styles = virtual_text.warnings or {},
		}, -- Used for "Warning" diagnostic virtual text
		DiagnosticVirtualTextInfo = {
			bg = U.blend(C.foreground, C.background, darkening_percentage),
			fg = C.foreground,
			styles = virtual_text.information or {},
		}, -- Used for "Information" diagnostic virtual text
		DiagnosticVirtualTextHint = {
			bg = U.blend(C.color6, C.background, darkening_percentage),
			fg = C.color6,
			styles = virtual_text.hints or {},
		}, -- Used for "Hint" diagnostic virtual text
	}
end

return M

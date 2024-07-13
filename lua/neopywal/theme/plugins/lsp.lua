local M = {}

function M.get()
	-- neovim/nvim-lspconfig
	return {
		-- These groups are for the native LSP client. Some other LSP clients may
		-- use these groups, or use their own. Consult your LSP client's documentation.

		LspInfoBorder = { link = "FloatBorder" }, -- LspInfo border
		LspCodeLens = { link = "Comment" }, -- virtual text of the codelens
		LspCodeLensSeparator = { link = "LspCodeLens" }, -- virtual text of the codelens separators

		LspReferenceText = { bg = U.blend(C.background, C.foreground, 0.2), styles = { "bold" } }, -- used for highlighting "text" references
		LspReferenceRead = { bg = U.blend(C.background, C.foreground, 0.2), styles = { "bold" } }, -- used for highlighting "read" references
		LspReferenceWrite = { bg = U.blend(C.background, C.foreground, 0.2), styles = { "bold" } }, -- used for highlighting "write" references

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

		LspDiagnosticsVirtualTextError = { fg = C.color1, styles = { "italic" } }, -- Used for "Error" diagnostic virtual text
		LspDiagnosticsVirtualTextWarning = {
			fg = U.blend(C.color1, C.color3, 0.5),
			styles = { "italic" },
		}, -- Used for "Warning" diagnostic virtual text
		LspDiagnosticsVirtualTextInformation = { fg = C.foreground, styles = { "italic" } }, -- Used for "Information" diagnostic virtual text
		LspDiagnosticsVirtualTextHint = { fg = C.color6, styles = { "italic" } }, -- Used for "Hint" diagnostic virtual text

		LspDiagnosticsUnderlineError = { link = "DiagnosticUnderlineError" }, -- Used to underline "Error" diagnostics
		LspDiagnosticsUnderlineWarning = { link = "DiagnosticUnderlineWarn" }, -- Used to underline "Warning" diagnostics
		LspDiagnosticsUnderlineInformation = { link = "DiagnosticUnderlineInfo" }, -- Used to underline "Information" diagnostics
		LspDiagnosticsUnderlineHint = { link = "DiagnosticUnderlineHint" }, -- Used to underline "Hint" diagnostics

		DiagnosticUnderlineOk = { sp = C.color2, styles = { "undercurl" } }, -- Used to underline "Ok" diagnostics
		DiagnosticUnderlineError = { sp = C.color1, styles = { "undercurl" } }, -- Used to underline "Error" diagnostics
		DiagnosticUnderlineWarn = { sp = U.blend(C.color1, C.color3, 0.5), styles = { "undercurl" } }, -- Used to underline "Warning" diagnostics
		DiagnosticUnderlineInfo = { sp = C.foreground, styles = { "undercurl" } }, -- Used to underline "Information" diagnostics
		DiagnosticUnderlineHint = { sp = C.color6, styles = { "undercurl" } }, -- Used to underline "Hint" diagnostics

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
			bg = U.blend(C.color2, C.background, 0.2),
			fg = C.color2,
			styles = { "bold" },
		}, -- Used for "Ok" diagnostic virtual text
		DiagnosticVirtualTextError = {
			bg = U.blend(C.color1, C.background, 0.2),
			fg = C.color1,
			styles = { "bold" },
		}, -- Used for "Error" diagnostic virtual text
		DiagnosticVirtualTextWarn = {
			bg = U.blend(U.blend(C.color1, C.color3, 0.5), C.background, 0.2),
			fg = U.blend(C.color1, C.color3, 0.5),
			styles = { "bold" },
		}, -- Used for "Warning" diagnostic virtual text
		DiagnosticVirtualTextInfo = {
			bg = U.blend(C.foreground, C.background, 0.2),
			fg = C.foreground,
			styles = { "bold" },
		}, -- Used for "Information" diagnostic virtual text
		DiagnosticVirtualTextHint = {
			bg = U.blend(C.color6, C.background, 0.2),
			fg = C.color6,
			styles = { "bold" },
		}, -- Used for "Hint" diagnostic virtual text
	}
end

return M

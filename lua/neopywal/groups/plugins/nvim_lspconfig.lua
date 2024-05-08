local M = {}

M.get = function(colors)
	return {
		-- neovim/nvim-lspconfig
		LspInlayHint                  = { link = "NonText" },
		LspDiagnosticsHint            = { fg = colors.color6 },
		LspDiagnosticsInformation     = { fg = colors.color7 },
		LspDiagnosticsWarning         = { fg = colors.color11 },
		LspDiagnosticsError           = { fg = colors.color1 },
		LspReferenceText              = { link = "CocHighlightText" },
		LspReferenceRead              = { link = "CocHighlightText" },
		LspReferenceWrite             = { link = "CocHighlightText" },
		LspInfoTitle                  = { link = "Title" },
		LspInfoTip                    = { link = "Comment" },
		LspInfoList                   = { link = "Function" },
		LspInfoBorder                 = { link = "Label" },
		LspInfoFiletype               = { link = "Type" },
		LspCodeLens                   = { link = "Comment" },
		LspSignatureActiveParameter   = { link = "Visual" },

		DiagnosticError       = { link = "LspDiagnosticsError" },
		DiagnosticWarn        = { link = "LspDiagnosticsWarning" },
		DiagnosticInfo        = { link = "LspDiagnosticsInformation" },
		DiagnosticHint        = { link = "LspDiagnosticsHint" },
		DiagnosticUnnecessary = { link = "Comment" },

		DiagnosticVirtualTextError = { link = "DiagnosticError" },
		DiagnosticVirtualTextWarn  = { link = "DiagnosticWarn" },
		DiagnosticVirtualTextInfo  = { link = "DiagnosticInfo" },
		DiagnosticVirtualTextHint  = { link = "DiagnosticHint" },

		DiagnosticUnderlineError = { link = "DiagnosticError", undercurl = true },
		DiagnosticUnderlineWarn  = { link = "DiagnosticWarn", undercurl = true },
		DiagnosticUnderlineInfo  = { link = "DiagnosticInfo", undercurl = true },
	}
end

return M

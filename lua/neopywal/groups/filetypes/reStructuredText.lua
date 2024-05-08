local M = {}

M.get = function(colors)
	return {
		-- ReStructuredText:
		-- builtin: https://github.com/marshallward/vim-restructuredtext
		rstStandaloneHyperlink                   = { bg = colors.background, fg = colors.color5, underline = true },
		rstEmphasis                              = { bg = colors.background, fg = colors.foreground, italic = true },
		rstStrongEmphasis                        = { bg = colors.background, fg = colors.foreground, bold = true },
		rstHyperlinkTarget                       = { bg = colors.background, fg = colors.color4, underline = true },
		rstSubstitutionReference                 = { fg = colors.color4 },
		rstInterpretedTextOrHyperlinkReference   = { fg = colors.color2 },
		rstTableLines                            = { fg = colors.color8 },
		rstInlineLiteral                         = { fg = colors.color2 },
		rstLiteralBlock                          = { fg = colors.color2 },
		rstQuotedLiteralBlock                    = { fg = colors.color2 },
	}
end

return M

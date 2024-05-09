local M = {}

M.get = function(colors)
	return {
		-- Html:
		-- builtin: https://notabug.org/jorgesumle/vim-html-syntax
		htmlH1                  = { bg = colors.background, fg = colors.color1, bold = true },
		htmlH2                  = { bg = colors.background, fg = colors.color11, bold = true },
		htmlH3                  = { bg = colors.background, fg = colors.color3, bold = true },
		htmlH4                  = { bg = colors.background, fg = colors.color2, bold = true },
		htmlH5                  = { bg = colors.background, fg = colors.color4, bold = true },
		htmlH6                  = { bg = colors.background, fg = colors.color5, bold = true },
		htmlLink                = { bg = colors.background, fg = colors.foreground, underline = true },
		htmlBold                = { bg = colors.background, fg = colors.foreground, bold = true },
		htmlBoldUnderline       = { bg = colors.background, fg = colors.foreground, bold = true, underline = true },
		htmlBoldItalic          = { bg = colors.background, fg = colors.foreground, bold = true, italic = true },
		htmlBoldUnderlineItalic = { bg = colors.background, fg = colors.foreground, bold = true, underline = true, italic = true },
		htmlUnderline           = { bg = colors.background, fg = colors.foreground, underline = true },
		htmlUnderlineItalic     = { bg = colors.background, fg = colors.foreground, underline = true, italic = true },
		htmlItalic              = { bg = colors.background, fg = colors.foreground, italic = true },
		htmlTag                 = { fg = colors.color2 },
		htmlEndTag              = { fg = colors.color4 },
		htmlTagN                = { fg = colors.color1, italic = true },
		htmlTagName             = { fg = colors.color1, italic = true },
		htmlArg                 = { fg = colors.color4 },
		htmlScriptTag           = { fg = colors.color5 },
		htmlSpecialTagName      = { fg = colors.color1, italic = true },
		htmlString              = { fg = colors.color2 },
	}
end

return M

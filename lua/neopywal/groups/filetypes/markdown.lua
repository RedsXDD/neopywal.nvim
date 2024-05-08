local M = {}

M.get = function(colors)
	return {
		-- Markdown:
		-- builtin:
		markdownH1                = { bg = colors.background, fg = colors.color1, bold = true },
		markdownH2                = { bg = colors.background, fg = colors.color11, bold = true },
		markdownH3                = { bg = colors.background, fg = colors.color3, bold = true },
		markdownH4                = { bg = colors.background, fg = colors.color2, bold = true },
		markdownH5                = { bg = colors.background, fg = colors.color4, bold = true },
		markdownH6                = { bg = colors.background, fg = colors.color5, bold = true },
		markdownUrl               = { bg = colors.background, fg = colors.color4, underline = true },
		markdownItalic            = { bg = colors.background, fg = colors.foreground, italic = true },
		markdownBold              = { bg = colors.background, fg = colors.foreground, bold = true },
		markdownItalicDelimiter   = { bg = colors.background, fg = colors.color8, italic = true },
		markdownCode              = { fg = colors.color2 },
		markdownCodeBlock         = { fg = colors.color2 },
		markdownCodeDelimiter     = { fg = colors.color2 },
		markdownBlockquote        = { fg = colors.color8 },
		markdownListMarker        = { fg = colors.color1 },
		markdownOrderedListMarker = { fg = colors.color1 },
		markdownRule              = { fg = colors.color5 },
		markdownHeadingRule       = { fg = colors.color8 },
		markdownUrlDelimiter      = { fg = colors.color8 },
		markdownLinkDelimiter     = { fg = colors.color8 },
		markdownLinkTextDelimiter = { fg = colors.color8 },
		markdownHeadingDelimiter  = { fg = colors.color8 },
		markdownLinkText          = { fg = colors.color1 },
		markdownUrlTitleDelimiter = { fg = colors.color2 },
		markdownIdDeclaration     = { link = "markdownLinkText" },
		markdownBoldDelimiter     = { fg = colors.color8 },
		markdownId                = { fg = colors.color3 },

		-- vim-markdown: https://github.com/gabrielelana/vim-markdown
		mkdURL            = { bg = colors.background, fg = colors.color4, underline = true },
		mkdInlineURL      = { bg = colors.background, fg = colors.color4, underline = true },
		mkdItalic         = { bg = colors.background, fg = colors.color8, italic = true },
		mkdCodeDelimiter  = { fg = colors.color2 },
		mkdBold           = { fg = colors.color8 },
		mkdLink           = { fg = colors.color1 },
		mkdHeading        = { fg = colors.color8 },
		mkdListItem       = { fg = colors.color1 },
		mkdRule           = { fg = colors.color5 },
		mkdDelimiter      = { fg = colors.color8 },
		mkdId             = { fg = colors.color3 },
	}
end

return M

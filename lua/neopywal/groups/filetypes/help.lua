local M = {}

M.get = function(colors)
	return {
		-- Help:
		helpNote           = { fg = colors.color5, bold = true },
		helpHeadline       = { fg = colors.color1, bold = true },
		helpHeader         = { fg = colors.color11, bold = true },
		helpURL            = { fg = colors.color2, underline = true },
		helpHyperTextEntry = { fg = colors.color4, bold = true },
		helpHyperTextJump  = { fg = colors.color4 },
		helpCommand        = { fg = colors.color3 },
		helpExample        = { fg = colors.color2 },
		helpSpecial        = { fg = colors.color5 },
	}
end

return M

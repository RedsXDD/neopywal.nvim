local M = {}

M.get = function(colors)
	return {
		-- LaTex:
		-- builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_TEX
		texStatement    = { fg = colors.color4, italic = true },
		texOnlyMath     = { fg = colors.color8 },
		texDefName      = { fg = colors.color3 },
		texNewCmd       = { fg = colors.color11 },
		texCmdName      = { fg = colors.color4 },
		texBeginEnd     = { fg = colors.color1 },
		texBeginEndName = { fg = colors.color2 },
		texDocType      = { fg = colors.color1, italic = true },
		texDocTypeArgs  = { fg = colors.color11 },
		texInputFile    = { fg = colors.color2 },
	}
end

return M

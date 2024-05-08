local M = {}

M.get = function(colors)
	return {
		-- Shell:
		-- builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_SH
		shRange         = { fg = colors.foreground },
		shOption        = { fg = colors.color5 },
		shQuote         = { fg = colors.color3 },
		shVariable      = { fg = colors.color4, italic = true },
		shDerefSimple   = { fg = colors.color4, italic = true },
		shDerefVar      = { fg = colors.color4, italic = true },
		shDerefSpecial  = { fg = colors.color4, italic = true },
		shDerefOff      = { fg = colors.color4, italic = true },
		shVarAssign     = { fg = colors.color1 },
		shFunctionOne   = { fg = colors.color2 },
		shFunctionKey   = { fg = colors.color1 },
	}
end

return M

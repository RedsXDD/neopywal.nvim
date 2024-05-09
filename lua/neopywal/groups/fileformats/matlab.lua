local M = {}

M.get = function(colors)
	return {
		-- Matlab:
		-- builtin:
		matlabSemicolon          = { fg = colors.foreground },
		matlabFunction           = { fg = colors.color1, italic = true },
		matlabImplicit           = { fg = colors.color2 },
		matlabDelimiter          = { fg = colors.foreground },
		matlabOperator           = { fg = colors.color2 },
		matlabArithmeticOperator = { fg = colors.color1 },
		matlabRelationalOperator = { fg = colors.color1 },
		matlabLogicalOperator    = { fg = colors.color1 },
	}
end

return M

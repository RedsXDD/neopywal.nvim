local M = {}

M.get = function(colors)
	return {
		-- SASS:
		-- scss-syntax: https://github.com/cakebaker/scss-syntax.vim
		scssMixinName              = { fg = colors.color11 },
		scssSelectorChar           = { fg = colors.color11 },
		scssSelectorName           = { fg = colors.color1 },
		scssInterpolationDelimiter = { fg = colors.color3 },
		scssVariableValue          = { fg = colors.color2 },
		scssNull                   = { fg = colors.color5 },
		scssBoolean                = { fg = colors.color5 },
		scssVariableAssignment     = { fg = colors.color8 },
		scssAttribute              = { fg = colors.color2 },
		scssFunctionName           = { fg = colors.color11 },
		scssVariable               = { fg = colors.foreground },
		scssAmpersand              = { fg = colors.color5 },
	}
end

return M

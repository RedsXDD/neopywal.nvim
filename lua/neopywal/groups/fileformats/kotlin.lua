local M = {}

M.get = function(colors)
	return {
		-- Kotlin:
		-- kotlin-vim: https://github.com/udalov/kotlin-vim
		ktSimpleInterpolation       = { fg = colors.color5 },
		ktComplexInterpolation      = { fg = colors.color5 },
		ktComplexInterpolationBrace = { fg = colors.color5 },
		ktStructure                 = { fg = colors.color1 },
		ktKeyword                   = { fg = colors.color11, italic = true },
	}
end

return M

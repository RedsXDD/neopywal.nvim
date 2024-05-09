local M = {}

M.get = function(colors)
	return {
		-- Scala:
		-- builtin: https://github.com/derekwyatt/vim-scala
		scalaNameDefinition        = { fg = colors.foreground },
		scalaInterpolationBoundary = { fg = colors.color5 },
		scalaInterpolation         = { fg = colors.color5 },
		scalaTypeOperator          = { fg = colors.color1 },
		scalaOperator              = { fg = colors.color1 },
		scalaKeywordModifier       = { fg = colors.color1 },
	}
end

return M

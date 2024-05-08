local M = {}

M.get = function(colors)
	return {
		-- Python:
		-- builtin:
		pythonBuiltin       = { fg = colors.color4, italic = true },
		pythonExceptions    = { fg = colors.color1 },
		pythonDecoratorName = { fg = colors.color11, italic = true },

		-- python-syntax: https://github.com/vim-python/python-syntax
		pythonExClass     = { fg = colors.color4, italic = true },
		pythonBuiltinType = { fg = colors.color4, italic = true },
		pythonBuiltinObj  = { fg = colors.color11, italic = true },
		pythonDottedName  = { fg = colors.color11, italic = true },
		pythonBuiltinFunc = { fg = colors.color2 },
		pythonFunction    = { fg = colors.color2 },
		pythonDecorator   = { fg = colors.color11, italic = true },
		pythonInclude     = { link = "Inclue" },
		pythonImport      = { link = "PreProc" },
		pythonOperator    = { fg = colors.color1 },
		pythonConditional = { fg = colors.color1 },
		pythonRepeat      = { fg = colors.color1 },
		pythonException   = { fg = colors.color1 },
		pythonNone        = { fg = colors.color11, italic = true },
		pythonCoding      = { fg = colors.color8 },
		pythonDot         = { fg = colors.color8 },

		-- semshi: https://github.com/numirias/semshi
		semshiUnresolved      = { bg = colors.background, fg = colors.color11, undercurl = true },
		semshiImported        = { fg = colors.color4, italic = true },
		semshiParameter       = { fg = colors.color11, italic = true },
		semshiParameterUnused = { fg = colors.color8 },
		semshiSelf            = { fg = colors.color4, italic = true },
		semshiGlobal          = { fg = colors.color2 },
		semshiBuiltin         = { fg = colors.color2 },
		semshiAttribute       = { fg = colors.color11, italic = true },
		semshiLocal           = { fg = colors.color1 },
		semshiFree            = { fg = colors.color1 },
		semshiSelected        = { link = "CocHighlightText" },
		semshiErrorSign       = { link = "ALEErrorSign" },
		semshiErrorChar       = { link = "ALEErrorSign" },
	}
end

return M

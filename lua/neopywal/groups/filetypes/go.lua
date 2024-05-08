local M = {}

M.get = function(colors)
	return {
		-- Go:
		-- builtin: https://github.com/google/vim-ft-go
		goDirective = { fg = colors.color1 },
		goConstants = { fg = colors.color11, italic = true },
		goDeclType  = { fg = colors.color1 },

		-- polyglot:
		goPackage               = { fg = colors.color1 },
		goImport                = { fg = colors.color1 },
		goBuiltins              = { fg = colors.color2 },
		goPredefinedIdentifiers = { fg = colors.color11, italic = true },
		goVar                   = { fg = colors.color1 },
	}
end

return M

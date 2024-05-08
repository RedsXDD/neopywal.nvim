local M = {}

M.get = function(colors)
	return {
		-- Dart:
		-- dart-lang: https://github.com/dart-lang/dart-vim-plugin
		dartCoreClasses   = { fg = colors.color4, italic = true },
		dartTypeName      = { fg = colors.color4, italic = true },
		dartInterpolation = { fg = colors.color5 },
		dartTypeDef       = { fg = colors.color1 },
		dartClassDecl     = { fg = colors.color1 },
		dartLibrary       = { fg = colors.color1 },
		dartMetadata      = { fg = colors.color11, italic = true },
	}
end

return M

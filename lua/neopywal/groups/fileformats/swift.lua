local M = {}

M.get = function(colors)
	return {
		-- Swift:
		-- swift.vim: https://github.com/keith/swift.vim
		swiftInterpolatedWrapper = { fg = colors.color5 },
		swiftInterpolatedString  = { fg = colors.color5 },
		swiftProperty            = { fg = colors.foreground },
		swiftTypeDeclaration     = { fg = colors.color1 },
		swiftClosureArgument     = { fg = colors.color11, italic = true },
		swiftStructure           = { fg = colors.color1 },
	}
end

return M

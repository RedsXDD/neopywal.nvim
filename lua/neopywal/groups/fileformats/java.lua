local M = {}

M.get = function(colors)
	return {
		-- Java:
		-- builtin:
		javaClassDecl  = { fg = colors.color1 },
		javaMethodDecl = { fg = colors.color1 },
		javaVarArg     = { fg = colors.foreground },
		javaAnnotation = { fg = colors.color5 },
		javaUserLabel  = { fg = colors.color5 },
		javaTypedef    = { fg = colors.color11, italic = true },
		javaParen      = { fg = colors.foreground },
		javaParen1     = { fg = colors.foreground },
		javaParen2     = { fg = colors.foreground },
		javaParen3     = { fg = colors.foreground },
		javaParen4     = { fg = colors.foreground },
		javaParen5     = { fg = colors.foreground },
	}
end

return M

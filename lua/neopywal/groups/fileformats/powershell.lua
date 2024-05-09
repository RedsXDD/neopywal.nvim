local M = {}

M.get = function(colors)
	return {
		-- PowerShell:
		-- vim-ps1: https://github.com/PProvost/vim-ps1
		ps1FunctionInvocation     = { fg = colors.color2 },
		ps1FunctionDeclaration    = { fg = colors.color2 },
		ps1InterpolationDelimiter = { fg = colors.color5 },
		ps1BuiltIn                = { fg = colors.color4, italic = true },
	}
end

return M

local M = {}

M.get = function(colors)
	return {
		-- Makefile:
		makeIdent      = { fg = colors.color5 },
		makeSpecTarget = { fg = colors.color4, italic = true },
		makeTarget     = { fg = colors.color11 },
	}
end

return M

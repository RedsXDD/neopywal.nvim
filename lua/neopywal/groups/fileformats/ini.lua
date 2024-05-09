local M = {}

M.get = function(colors)
	return {
		-- INI:
		dosiniHeader = { fg = colors.color1, bold = true },
		dosiniLabel  = { fg = colors.color4 },
		dosiniValue  = { fg = colors.color2 },
		dosiniNumber = { fg = colors.color2 },
	}
end

return M

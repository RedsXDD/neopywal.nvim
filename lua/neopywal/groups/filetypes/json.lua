local M = {}

M.get = function(colors)
	return {
		-- Json:
		jsonKeyword = { fg = colors.color1 },
		jsonString  = { fg = colors.color2 },
		jsonBoolean = { fg = colors.color4 },
		jsonNoise   = { fg = colors.color8 },
		jsonQuote   = { fg = colors.color8 },
	}
end

return M

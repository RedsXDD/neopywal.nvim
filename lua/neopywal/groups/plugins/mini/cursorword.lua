local M = {}

M.get = function(colors)
	return {
		-- mini.cursorword
		MiniCursorword        = { bg = colors.color8, bold = true },
	}
end

return M

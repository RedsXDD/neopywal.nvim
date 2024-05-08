local M = {}

M.get = function(colors)
	return {
		-- Diff:
		diffAdded     = { fg = colors.color2 },
		diffRemoved   = { fg = colors.color1 },
		diffChanged   = { fg = colors.color4 },
		diffOldFile   = { fg = colors.color3 },
		diffNewFile   = { fg = colors.color11 },
		diffFile      = { fg = colors.color5 },
		diffLine      = { fg = colors.color8 },
	}
end

return M

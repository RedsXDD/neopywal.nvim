local M = {}

M.get = function(colors)
	return {
		-- goolord/alpha-nvim
		AlphaShortcut    = { fg = colors.color11 },
		AlphaHeader      = { fg = colors.color4 },
		AlphaHeaderLabel = { fg = colors.color11 },
		AlphaFooter      = { fg = colors.color4 },
	}
end

return M

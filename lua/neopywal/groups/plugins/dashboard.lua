local M = {}

M.get = function(colors)
	return {
		-- nvimdev/dashboard-nvim
		DashboardShortCut = { fg = colors.color6 },
		DashboardHeader   = { fg = colors.color4 },
		DashboardCenter   = { fg = colors.color5 },
		DashboardFooter   = { fg = colors.color4 },
		DashboardKey      = { fg = colors.color11 },
		DashboardDesc     = { fg = colors.color6 },
	}
end

return M

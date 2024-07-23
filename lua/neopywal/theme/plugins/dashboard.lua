local M = {}

function M.get()
	return {
		DashboardShortCut = { fg = U.blend(C.color1, C.color3, 0.5) },
		DashboardHeader = { fg = C.color4 },
		DashboardCenter = { fg = C.color6 },
		DashboardFooter = { fg = C.color5 },
		DashboardKey = { fg = C.color1 },
		DashboardDesc = { fg = C.foreground },
		DashboardIcon = { link = "DashboardDesc" },
	}
end

return M

local M = {}

M.get = function(colors)
	return {
		-- mini.tabline
		MiniTablineCurrent         = { bg = colors.color4, fg = colors.background, bold = true, italic = true },
		MiniTablineFill            = { link = "TabLineFill" },
		MiniTablineVisible         = { link = "TabLine" },
		MiniTablineHidden          = { link = "MiniTablineVisible" },
		MiniTablineModifiedCurrent = { bg = colors.color3, fg = colors.background, bold = true, italic = true },
		MiniTablineModifiedVisible = { fg = colors.color6 },
		MiniTablineModifiedHidden  = { fg = colors.color5 },
		MiniTablineTabpagesection  = { bg = colors.color4, fg = colors.background, bold = true },
	}
end

return M

local M = {}

M.get = function(colors)
	return {
		-- mini.statusline
		MiniStatuslineModeNormal   = { bg = colors.color4, fg = colors.background, bold = true },
		MiniStatuslineModeVisual   = { bg = colors.color5, fg = colors.background, bold = true },
		MiniStatuslineModeInsert   = { bg = colors.color6, fg = colors.background, bold = true },
		MiniStatuslineModeCommand  = { bg = colors.color1, fg = colors.background, bold = true },
		MiniStatuslineModeReplace  = { bg = colors.color2, fg = colors.background, bold = true },
		MiniStatuslineModeOther    = { bg = colors.color3, fg = colors.background, bold = true },
		MiniStatuslineModeDevInfo  = { link = "StatusLine", bold = true },
		MiniStatuslineModeFilename = { link = "StatusLineNC", bold = true },
		MiniStatuslineModeFileInfo = { link = "StatusLineNC", bold = true },
		MiniStatuslineModeInactive = { link = "Normal", bold = true },
	}
end

return M

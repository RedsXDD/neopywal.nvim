local M = {}

function M.get()
	-- echasnovski/mini.statusline
	return {
		MiniStatuslineModeNormal = { bg = C.color4, fg = C.background, styles = { "bold" } },
		MiniStatuslineModeVisual = { bg = C.color5, fg = C.background, styles = { "bold" } },
		MiniStatuslineModeInsert = { bg = C.color6, fg = C.background, styles = { "bold" } },
		MiniStatuslineModeCommand = { bg = C.color1, fg = C.background, styles = { "bold" } },
		MiniStatuslineModeReplace = { bg = C.color2, fg = C.background, styles = { "bold" } },
		MiniStatuslineModeOther = { bg = C.color3, fg = C.background, styles = { "bold" } },
		MiniStatuslineModeDevInfo = { link = "StatusLine" },
		MiniStatuslineModeFilename = { link = "StatusLineNC" },
		MiniStatuslineModeFileInfo = { link = "StatusLineNC" },
		MiniStatuslineModeInactive = { link = "StatusLineNC" },
	}
end

return M

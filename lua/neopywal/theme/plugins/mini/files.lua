local M = {}

function M.get()
	-- echasnovski/mini.files
	return {
		MiniFilesBorder = { link = "FloatBorder" },
		MiniFilesBorderModified = { fg = C.warn },
		MiniFilesCursorLine = { link = "CursorLine" },
		MiniFilesDirectory = { link = "Directory" },
		MiniFilesFile = {},
		MiniFilesNormal = { link = "NormalFloat" },
		MiniFilesTitle = { fg = C.comment },
		MiniFilesTitleFocused = { link = "FloatTitle" },
	}
end

return M

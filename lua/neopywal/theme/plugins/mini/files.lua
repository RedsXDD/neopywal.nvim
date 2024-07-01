local M = {}

function M.get()
	-- echasnovski/mini.files
	return {
		MiniFilesBorder = { link = "FloatBorder" },
		MiniFilesBorderModified = { link = "DiagnosticWarn" },
		MiniFilesCursorLine = { link = "CursorLine" },
		MiniFilesDirectory = { link = "Directory" },
		MiniFilesFile = {},
		MiniFilesNormal = { link = "NormalFloat" },
		MiniFilesTitle = { link = "Comment" },
		MiniFilesTitleFocused = { link = "FloatTitle" },
	}
end

return M

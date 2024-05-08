local M = {}

M.get = function(colors)
	return {
		-- mini.files
		MiniFilesBorder         = { link = "FloatBorder" },
		MiniFilesBorderModified = { link = "DiagnosticVirtualTextWarn" },
		MiniFilesCursorLine     = { link = "CursorLine" },
		MiniFilesDirectory      = { link = "Directory" },
		MiniFilesFile           = {},
		MiniFilesNormal         = { link = "NormalFloat" },
		MiniFilesTitle          = { link = "Comment" },
	}
end

return M

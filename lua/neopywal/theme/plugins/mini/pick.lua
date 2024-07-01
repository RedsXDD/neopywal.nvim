local M = {}

function M.get()
	-- echasnovski/mini.pick
	return {
		MiniPickBorder = { link = "FloatBorder" },
		MiniPickBorderBusy = { link = "DiagnosticWarn" },
		MiniPickBorderText = { link = "FloatTitle" },
		MiniPickIconDirectory = { link = "Directory" },
		MiniPickNormal = { link = "NormalFloat" },
		MiniPickIconFile = { link = "MiniPickNormal" },
		MiniPickHeader = { link = "DiagnosticHint" },
		MiniPickMatchCurrent = { link = "CursorLine" },
		MiniPickMatchMarked = { link = "Visual" },
		MiniPickMatchRanges = { fg = C.color4 },
		MiniPickPreviewLine = { link = "CursorLine" },
		MiniPickPreviewRegion = { link = "IncSearch" },
		MiniPickPrompt = { link = "FloatTitle" },
	}
end

return M

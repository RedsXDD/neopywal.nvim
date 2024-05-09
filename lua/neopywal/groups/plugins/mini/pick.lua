local M = {}

M.get = function(colors)
	return {
		-- mini.pick
		MiniPickBorder        = { link = "FloatBorder" },
		MiniPickBorderBusy    = { link = "DiagnosticVirtualTextWarn" },
		MiniPickBorderText    = { link = "FloatTitle" },
		MiniPickIconDirectory = { link = "Directory" },
		MiniPickIconFile      = { link = "MiniPickNormal" },
		MiniPickNormal        = { link = "NormalFloat" },
		MiniPickHeader        = { link = "DiagnosticVirtualTextHint" },
		MiniPickMatchCurrent  = { link = "CursorLine" },
		MiniPickMatchMarked   = { link = "Visual" },
		MiniPickMatchRanges   = { fg = colors.color4 },
		MiniPickPreviewLine   = { link = "CursorLine" },
		MiniPickPreviewRegion = { link = "IncSearch" },
		MiniPickPrompt        = { link = "FloatTitle" },
	}
end

return M

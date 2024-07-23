local M = {}

function M.get()
	return {
		MiniMapNormal = { link = "NormalFloat" },
		MiniMapSymbolCount = { fg = C.special },
		MiniMapSymbolLine = { fg = C.color4 },
		MiniMapSymbolView = { fg = C.delimiter },
	}
end

return M

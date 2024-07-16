local M = {}

function M.get()
	-- echasnovski/mini.indentscope
	return {
		MiniIndentscopeSymbol = { fg = C.comment },
		MiniIndentscopeSymbolOff = { link = "MiniIndentscopeSymbol" },
	}
end

return M

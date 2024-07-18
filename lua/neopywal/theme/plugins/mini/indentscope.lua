local M = {}

function M.get()
	-- echasnovski/mini.indentscope
	return {
		MiniIndentscopeSymbol = { fg = C.comment },
		MiniIndentscopeSymbolOff = { link = "MiniIndentscopeSymbol" },
		MiniIndentscopePrefix = { styles = { "nocombine" } }, -- Make it invisible
	}
end

return M

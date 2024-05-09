local M = {}

M.get = function(colors)
	return {
		-- mini.indentscope
		MiniIndentscopeSymbol    = { link = "Comment" },
		MiniIndentscopeSymbolOff = { link = "MiniIndentscopeSymbol" },
	}
end

return M

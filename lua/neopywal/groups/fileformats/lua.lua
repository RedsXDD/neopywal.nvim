local M = {}

M.get = function(colors)
	return {
		-- Lua:
		-- builtin:
		luaFunc     = { fg = colors.color2 },
		luaFunction = { fg = colors.color1 },
		luaTable    = { fg = colors.color4 },
		luaIn       = { fg = colors.color1 },

		-- vim-lua: https://github.com/tbastos/vim-lua
		luaFuncCall     = { fg = colors.color2 },
		luaLocal        = { fg = colors.color1 },
		luaSpecialValue = { fg = colors.color2 },
		luaBraces       = { fg = colors.foreground },
		luaBuiltIn      = { fg = colors.color4, italic = true },
		luaNoise        = { fg = colors.color8 },
		luaLabel        = { fg = colors.color5 },
		luaFuncTable    = { fg = colors.color4, italic = true },
		luaFuncArgName  = { fg = colors.foreground },
		luaEllipsis     = { fg = colors.color1 },
		luaDocTag       = { fg = colors.color2 },
	}
end

return M

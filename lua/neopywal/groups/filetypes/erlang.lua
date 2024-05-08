local M = {}

M.get = function(colors)
	return {
		-- Erlang:
		--: builtin: https://github.com/vim-erlang/vim-erlang-runtime
		erlangAtom           = { fg = colors.foreground },
		erlangVariable       = { fg = colors.foreground },
		erlangLocalFuncRef   = { fg = colors.color2 },
		erlangLocalFuncCall  = { fg = colors.color2 },
		erlangGlobalFuncRef  = { fg = colors.color2 },
		erlangGlobalFuncCall = { fg = colors.color2 },
		erlangAttribute      = { fg = colors.color4, italic = true },
		erlangPipe           = { fg = colors.color1 },
	}
end

return M

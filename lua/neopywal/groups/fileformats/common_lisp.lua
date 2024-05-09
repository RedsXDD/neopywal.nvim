local M = {}

M.get = function(colors)
	return {
		-- Common Lisp:
		-- builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_LISP
		lispAtomMark = { fg = colors.color5 },
		lispKey      = { fg = colors.color11 },
		lispFunc     = { fg = colors.color2 },
	}
end

return M

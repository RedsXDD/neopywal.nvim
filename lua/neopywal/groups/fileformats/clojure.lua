local M = {}

M.get = function(colors)
	return {
		-- Clojure:
		-- builtin: https://github.com/guns/vim-clojure-static
		clojureMacro    = { fg = colors.color1 },
		clojureFunc     = { fg = colors.color2 },
		clojureConstant = { fg = colors.color11, italic = true },
		clojureSpecial  = { fg = colors.color1 },
		clojureDefine   = { fg = colors.color1 },
		clojureKeyword  = { fg = colors.color4 },
		clojureVariable = { fg = colors.foreground },
		clojureMeta     = { fg = colors.color5 },
		clojureDeref    = { fg = colors.color5 },
	}
end

return M

local M = {}

M.get = function(colors)
	return {
		-- Haskell:
		-- haskell-vim: https://github.com/neovimhaskell/haskell-vim
		haskellBrackets        = { fg = colors.foreground },
		haskellIdentifier      = { fg = colors.color11, italic = true },
		haskellDecl            = { fg = colors.color1 },
		haskellType            = { fg = colors.color4, italic = true },
		haskellDeclKeyword     = { fg = colors.color1 },
		haskellWhere           = { fg = colors.color1 },
		haskellDeriving        = { fg = colors.color1 },
		haskellForeignKeywords = { fg = colors.color1 },
	}
end

return M

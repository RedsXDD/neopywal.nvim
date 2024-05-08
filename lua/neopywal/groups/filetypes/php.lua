local M = {}

M.get = function(colors)
	return {
		-- PHP:
		-- builtin: https://jasonwoof.com/gitweb/?p=vim-syntax.git;a=blob;f=php.vim;hb=HEAD
		phpVarSelector       = { fg = colors.foreground },
		phpIdentifier        = { fg = colors.foreground },
		phpDefine            = { fg = colors.color2 },
		phpStructure         = { fg = colors.color1 },
		phpSpecialFunction   = { fg = colors.color2 },
		phpInterpSimpleCurly = { fg = colors.color5 },
		phpComparison        = { fg = colors.color1 },
		phpMethodsVar        = { fg = colors.foreground },
		phpInterpVarname     = { fg = colors.foreground },
		phpMemberSelector    = { fg = colors.color1 },
		phpLabel             = { fg = colors.color1 },

		-- php.vim: https://github.com/StanAngeloff/php.vim
		phpParent       = { fg = colors.foreground },
		phpNowDoc       = { fg = colors.color3 },
		phpFunction     = { fg = colors.color2 },
		phpMethod       = { fg = colors.color2 },
		phpClass        = { fg = colors.color4, italic = true },
		phpSuperglobals = { fg = colors.color4, italic = true },
		phpNullValue    = { fg = colors.color11, italic = true },
	}
end

return M

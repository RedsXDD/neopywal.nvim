local M = {}

M.get = function(colors)
	return {
		-- JavaScript React:
		-- vim-jsx-pretty: https://github.com/maxmellon/vim-jsx-pretty
		jsxTagName    = { fg = colors.color1, italic = true },
		jsxOpenPunct  = { fg = colors.color2 },
		jsxClosePunct = { fg = colors.color4 },
		jsxEscapeJs   = { fg = colors.color5 },
		jsxAttrib     = { fg = colors.color4 },
	}
end

return M

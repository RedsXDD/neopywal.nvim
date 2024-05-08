local M = {}

M.get = function(colors)
	return {
		-- VimL:
		vimLet            = { fg = colors.color1 },
		vimFunction       = { fg = colors.color2 },
		vimIsCommand      = { fg = colors.foreground },
		vimUserFunc       = { fg = colors.color2 },
		vimFuncName       = { fg = colors.color2 },
		vimMap            = { fg = colors.color4, italic = true },
		vimNotation       = { fg = colors.color5 },
		vimMapLhs         = { fg = colors.color2 },
		vimMapRhs         = { fg = colors.color2 },
		vimSetEqual       = { fg = colors.color4, italic = true },
		vimSetSep         = { fg = colors.foreground },
		vimOption         = { fg = colors.color4, italic = true },
		vimUserAttrbKey   = { fg = colors.color4, italic = true },
		vimUserAttrb      = { fg = colors.color2 },
		vimAutoCmdSfxList = { fg = colors.color11 },
		vimSynType        = { fg = colors.color11 },
		vimHiBang         = { fg = colors.color11 },
	}
end

return M

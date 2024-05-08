local M = {}

M.get = function(colors)
	return {
		-- dense-analysis/ale
		ALEError                   = { fg = colors.color1, undercurl = true },
		ALEWarning                 = { fg = colors.color3, undercurl = true },
		ALEInfo                    = { fg = colors.color4, undercurl = true },
		ALEErrorSign               = { fg = colors.color1 },
		ALEWarningSign             = { fg = colors.color3 },
		ALEInfoSign                = { fg = colors.color4 },
		ALEVirtualTextError        = { fg = colors.color8 },
		ALEVirtualTextWarning      = { fg = colors.color8 },
		ALEVirtualTextInfo         = { fg = colors.color8 },
		ALEVirtualTextStyleError   = { link = "ALEVirtualTextError" },
	}
end

return M

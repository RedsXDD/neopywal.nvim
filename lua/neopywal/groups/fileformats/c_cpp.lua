local M = {}

M.get = function(colors)
	return {
		-- C/C++:
		-- vim-cpp-enhanced-highlight: https://github.com/octol/vim-cpp-enhanced-highlight
		cLabel          = { fg = colors.color1 },
		cppSTLnamespace = { fg = colors.color4, italic = true },
		cppSTLtype      = { fg = colors.color4, italic = true },
		cppAccess       = { fg = colors.color1 },
		cppStructure    = { fg = colors.color1 },
		cppSTLios       = { fg = colors.color4, italic = true },
		cppSTLiterator  = { fg = colors.color4, italic = true },
		cppSTLexception = { fg = colors.color1 },

		-- vim-cpp-modern: https://github.com/bfrg/vim-cpp-modern
		cppSTLVariable = { fg = colors.color4, italic = true },

		-- chromatica: https://github.com/arakashic/chromatica.nvim
		Member              = { fg = colors.color11, italic = true },
		-- Variable            = { fg = colors.foreground },
		Namespace           = { fg = colors.color4, italic = true },
		EnumConstant        = { fg = colors.color11, italic = true },
		chromaticaException = { fg = colors.color1 },
		chromaticaCast      = { fg = colors.color1 },
		OperatorOverload    = { fg = colors.color1 },
		AccessQual          = { fg = colors.color1 },
		Linkage             = { fg = colors.color1 },
		AutoType            = { fg = colors.color4, italic = true },

		-- vim-lsp-cxx-highlight https://github.com/jackguo380/vim-lsp-cxx-highlight
		LspCxxHlSkippedRegion         = { fg = colors.color8 },
		LspCxxHlSkippedRegionBeginEnd = { fg = colors.color1 },
		LspCxxHlGroupEnumConstant     = { fg = colors.color11, italic = true },
		LspCxxHlGroupNamespace        = { fg = colors.color4, italic = true },
		LspCxxHlGroupMemberVariable   = { fg = colors.color11, italic = true },
	}
end

return M

local M = {}

M.get = function(colors)
	return {
		-- Xml:
		-- builtin: https://github.com/chrisbra/vim-xml-ftplugin
		xmlTag            = { fg = colors.color2 },
		xmlEndTag         = { fg = colors.color4 },
		xmlTagName        = { fg = colors.color1, italic = true },
		xmlEqual          = { fg = colors.color11 },
		xmlAttrib         = { fg = colors.color4 },
		xmlEntity         = { fg = colors.color1 },
		xmlEntityPunct    = { fg = colors.color1 },
		xmlDocTypeDecl    = { fg = colors.color8 },
		xmlDocTypeKeyword = { fg = colors.color1, italic = true },
		xmlCdataStart     = { fg = colors.color8 },
		xmlCdataCdata     = { fg = colors.color5 },
		xmlString         = { fg = colors.color2 },
	}
end

return M

local M = {}
local O = require("neopywal").options

M.get = function(colors)
	return {
		-- Syntax:
		Type           = { fg = colors.color4, italic = true },
		Structure      = { fg = colors.color4, italic = true },
		StorageClass   = { fg = colors.color4, italic = true },
		Identifier     = { fg = colors.color11, italic = true },
		Constant       = { fg = colors.color11, italic = true },
		PreProc        = { fg = colors.color1 },
		PreCondit      = { fg = colors.color1 },
		Include        = { fg = colors.color1 },
		Keyword        = { fg = colors.color1 },
		Define         = { fg = colors.color1 },
		Typedef        = { fg = colors.color1 },
		Exception      = { fg = colors.color1 },
		Conditional    = { fg = colors.color1 },
		Repeat         = { fg = colors.color1 },
		Statement      = { fg = colors.color1 },
		Macro          = { fg = colors.color5 },
		Error          = { fg = colors.color1 },
		Label          = { fg = colors.color5 },
		Special        = { fg = colors.color5 },
		SecialChar    = { fg = colors.color5 },
		SpecialComment = { fg = colors.color8, italic = true },
		Substitute     = { bg = colors.color4, fg = colors.background, bold = true },
		Variable       = { fg = colors.color4 },
		Boolean        = { fg = colors.color5 },
		String         = { fg = colors.color3 },
		Character      = { fg = colors.color3 },
		Number         = { fg = colors.color5 },
		Float          = { bg = O.transparent and colors.none or colors.background, fg = colors.color5 },
		NormalFloat    = { bg = O.transparent and colors.none or colors.background },
		FloatBorder    = { bg = O.transparent and colors.none or colors.background },
		FloatTitle     = { fg = colors.color2, bold = true, italic = true },
		Function       = { fg = colors.color2 },
		Operator       = { fg = colors.color1 },
		Title          = { fg = colors.color1, bold = true },
		Tag            = { fg = colors.color11 },
		Delimiter      = { fg = colors.foreground },
		Comment        = { fg = colors.color8, italic = true },
		Todo           = { fg = colors.color4, bold = true, italic = true },
		Ignore         = { fg = colors.color8 },
		Underlined     = { underline = true },
	}
end

return M

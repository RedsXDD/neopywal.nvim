local M = {}

M.get = function(colors)
	return {
		-- mini.hipatterns
		MiniHipatternsFixme = { bg = colors.color1, fg = colors.background, bold = true, italic = true },
		MiniHipatternsHack  = { bg = colors.color11, fg = colors.background, bold = true, italic = true },
		MiniHipatternsTodo  = { bg = colors.color4, fg = colors.background, bold = true, italic = true },
		MiniHipatternsNote  = { bg = colors.foreground, fg = colors.background, bold = true, italic = true },
	}
end

return M

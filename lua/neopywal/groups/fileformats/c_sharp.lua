local M = {}

M.get = function(colors)
	return {
		-- C#:
		-- builtin: https://github.com/nickspoons/vim-cs
		csUnspecifiedStatement   = { fg = colors.color1 },
		csStorage                = { fg = colors.color1 },
		csClass                  = { fg = colors.color1 },
		csNewType                = { fg = colors.color4, italic = true },
		csContextualStatement    = { fg = colors.color1 },
		csInterpolationDelimiter = { fg = colors.color5 },
		csInterpolation          = { fg = colors.color5 },
		csEndColon               = { fg = colors.foreground },
	}
end

return M

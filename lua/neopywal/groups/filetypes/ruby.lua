local M = {}

M.get = function(colors)
	return {
		-- Ruby:
		-- builtin: https://github.com/vim-ruby/vim-ruby
		rubyKeywordAsMethod        = { fg = colors.color2 },
		rubyInterpolation          = { fg = colors.color5 },
		rubyInterpolationDelimiter = { fg = colors.color5 },
		rubyStringDelimiter        = { fg = colors.color3 },
		rubyBlockParameterList     = { fg = colors.foreground },
		rubyDefine                 = { fg = colors.color1 },
		rubyModuleName             = { fg = colors.color1 },
		rubyAccess                 = { fg = colors.color1 },
		rubyMacro                  = { fg = colors.color1 },
		rubySymbol                 = { fg = colors.foreground },
	}
end

return M

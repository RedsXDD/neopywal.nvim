local M = {}

M.get = function(colors)
	return {
		-- airblade/vim-gitgutter
		GitGutterAdd          = { fg = colors.color2 },
		GitGutterChange       = { fg = colors.color4 },
		GitGutterDelete       = { fg = colors.color1 },
	}
end

return M

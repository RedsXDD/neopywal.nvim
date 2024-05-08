local M = {}

M.get = function(colors)
	return {
		-- Zsh:
		-- builtin: https://github.com/chrisbra/vim-zsh
		zshOption   = { fg = colors.color4, italic = true },
		zshSubst    = { fg = colors.color11 },
		zshFunction = { fg = colors.color2 },
	}
end

return M

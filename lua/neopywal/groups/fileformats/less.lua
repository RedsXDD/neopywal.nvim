local M = {}

M.get = function(colors)
	return {
		-- LESS:
		-- vim-less: https://github.com/groenewege/vim-less
		lessMixinChar = { fg = colors.color8 },
		lessClass     = { fg = colors.color1 },
		lessFunction  = { fg = colors.color11 },
	}
end

return M

local M = {}

M.get = function(colors)
	return {
		-- vim.org/netrw
		--: https://www.vim.org/scripts/script.php?script_id=1075
		netrwDir      = { link = "Directory" },
		netrwClassify = { fg = colors.color2 },
		netrwLink     = { fg = colors.color8 },
		netrwSymLink  = { fg = colors.foreground },
		netrwExe      = { fg = colors.color1 },
		netrwComment  = { link = "Comment" },
		netrwList     = { fg = colors.color3 },
		netrwHelpCmd  = { fg = colors.color4 },
		netrwCmdSep   = { fg = colors.color8 },
	}
end

return M

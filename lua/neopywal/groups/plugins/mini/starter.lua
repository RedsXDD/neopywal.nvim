local M = {}

M.get = function(colors)
	return {
		-- mini.starter
		MiniStarterCurrent    = { link = "CursorLine" },
		MiniStarterHeader     = { fg = colors.color4, bold = true, italic = true },
		MiniStarterFooter     = { fg = colors.color5, bold = true, italic = true },
		MiniStarterInactive   = { link = "Comment" },
		MiniStarterItem       = { link = "Normal" },
		MiniStarterItemBullet = { link = "Delimiter" },
		MiniStarterItemPrefix = { fg = colors.foreground, bold = true, italic = true },
		MiniStarterSection    = { fg = colors.color6, bold = true, italic = true },
	}
end

return M

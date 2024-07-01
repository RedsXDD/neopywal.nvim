local M = {}

function M.get()
	-- echasnovski/mini.starter
	return {
		MiniStarterCurrent = { link = "CursorLine" },
		MiniStarterHeader = { fg = C.color4, styles = { "bold", "italic" } },
		MiniStarterFooter = { fg = C.color5, styles = { "bold", "italic" } },
		MiniStarterInactive = { link = "Comment" },
		MiniStarterItem = { link = "Normal" },
		MiniStarterItemBullet = { link = "Delimiter" },
		MiniStarterItemPrefix = { fg = C.foreground, styles = { "bold", "italic" } },
		MiniStarterSection = { fg = C.color6, styles = { "bold", "italic" } },
		MiniStarterQuery = { fg = C.color1 },
	}
end

return M

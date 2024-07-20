local M = {}

function M.get()
	-- echasnovski/mini.icons
	return {
		MiniIconsAzure = { fg = C.foreground },
		MiniIconsBlue = { fg = C.color4 },
		MiniIconsCyan = { fg = C.color6 },
		MiniIconsGreen = { fg = C.color2 },
		MiniIconsGrey = { fg = C.color8 },
		MiniIconsOrange = { fg = U.blend(C.color1, C.color3, 0.5) },
		MiniIconsPurple = { fg = C.color5 },
		MiniIconsRed = { fg = C.color1 },
		MiniIconsYellow = { fg = C.color3 },
	}
end

return M

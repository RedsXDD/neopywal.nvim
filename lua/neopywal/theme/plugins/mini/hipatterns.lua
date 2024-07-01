local M = {}

function M.get()
	-- echasnovski/mini.hipatterns
	return {
		MiniHipatternsFixme = { bg = C.color1, fg = C.background, styles = { "bold", "italic" } },
		MiniHipatternsHack = {
			bg = U.blend(C.color1, C.color3, 0.5),
			fg = C.background,
			styles = { "bold", "italic" },
		},
		MiniHipatternsTodo = { bg = C.color4, fg = C.background, styles = { "bold", "italic" } },
		MiniHipatternsNote = { bg = C.foreground, fg = C.background, styles = { "bold", "italic" } },
	}
end

return M

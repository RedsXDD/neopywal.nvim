local M = {}

function M.get()
	-- echasnovski/mini.hipatterns
	return {
		MiniHipatternsFixme = { bg = C.error, fg = C.background, styles = { "bold", "italic" } },
		MiniHipatternsHack = {
			bg = C.warn,
			fg = C.background,
			styles = { "bold", "italic" },
		},
		MiniHipatternsTodo = { bg = C.color4, fg = C.background, styles = { "bold", "italic" } },
		MiniHipatternsNote = { bg = C.foreground, fg = C.background, styles = { "bold", "italic" } },
	}
end

return M

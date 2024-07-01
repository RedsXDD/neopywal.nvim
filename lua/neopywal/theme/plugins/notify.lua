local M = {}

function M.get()
	-- rcarriga/nvim-notify
	return {
		NotifyBackground = { bg = "#000000" },
		NotifyERRORBody = {
			bg = (O.transparent_background and vim.o.winblend == 0) and C.none or C.background,
			fg = C.color1,
		},
		NotifyWARNBody = {
			bg = (O.transparent_background and vim.o.winblend == 0) and C.none or C.background,
			fg = U.blend(C.color1, C.color3, 0.5),
		},
		NotifyINFOBody = {
			bg = (O.transparent_background and vim.o.winblend == 0) and C.none or C.background,
			fg = C.foreground,
		},
		NotifyDEBUGBody = {
			bg = (O.transparent_background and vim.o.winblend == 0) and C.none or C.background,
			fg = C.color8,
		},
		NotifyTRACEBody = {
			bg = (O.transparent_background and vim.o.winblend == 0) and C.none or C.background,
			fg = C.color6,
		},

		NotifyERRORBorder = { link = "NotifyERRORBody" },
		NotifyERRORIcon = { fg = C.color1 },
		NotifyERRORTitle = { fg = C.color1, styles = { "italic" } },

		NotifyWARNBorder = { link = "NotifyWARNBody" },
		NotifyWARNIcon = { fg = U.blend(C.color1, C.color3, 0.5) },
		NotifyWARNTitle = { fg = U.blend(C.color1, C.color3, 0.5), styles = { "italic" } },

		NotifyINFOBorder = { link = "NotifyINFOBody" },
		NotifyINFOIcon = { fg = C.foreground },
		NotifyINFOTitle = { fg = C.foreground, styles = { "italic" } },

		NotifyDEBUGBorder = { link = "NotifyDEBUGBody" },
		NotifyDEBUGIcon = { fg = C.color8 },
		NotifyDEBUGTitle = { fg = C.color8, styles = { "italic" } },

		NotifyTRACEBorder = { link = "NotifyTRACEBody" },
		NotifyTRACEIcon = { fg = C.color6 },
		NotifyTRACETitle = { fg = C.color6, styles = { "italic" } },
	}
end

return M

local M = {}

function M.get()
	-- rcarriga/nvim-notify
	return {
		NotifyBackground = { bg = "#000000" },
		NotifyERRORBody = {
			bg = (O.transparent_background and vim.o.winblend == 0) and C.none or C.background,
			fg = C.error,
		},
		NotifyWARNBody = {
			bg = (O.transparent_background and vim.o.winblend == 0) and C.none or C.background,
			fg = C.warn,
		},
		NotifyINFOBody = {
			bg = (O.transparent_background and vim.o.winblend == 0) and C.none or C.background,
			fg = C.info,
		},
		NotifyDEBUGBody = {
			bg = (O.transparent_background and vim.o.winblend == 0) and C.none or C.background,
			fg = C.unnecessary,
		},
		NotifyTRACEBody = {
			bg = (O.transparent_background and vim.o.winblend == 0) and C.none or C.background,
			fg = C.hint,
		},

		NotifyERRORBorder = { link = "NotifyERRORBody" },
		NotifyERRORIcon = { fg = C.error },
		NotifyERRORTitle = { fg = C.error, styles = { "italic" } },

		NotifyWARNBorder = { link = "NotifyWARNBody" },
		NotifyWARNIcon = { fg = C.warn },
		NotifyWARNTitle = { fg = C.warn, styles = { "italic" } },

		NotifyINFOBorder = { link = "NotifyINFOBody" },
		NotifyINFOIcon = { fg = C.info },
		NotifyINFOTitle = { fg = C.info, styles = { "italic" } },

		NotifyDEBUGBorder = { link = "NotifyDEBUGBody" },
		NotifyDEBUGIcon = { fg = C.unnecessary },
		NotifyDEBUGTitle = { fg = C.unnecessary, styles = { "italic" } },

		NotifyTRACEBorder = { link = "NotifyTRACEBody" },
		NotifyTRACEIcon = { fg = C.hint },
		NotifyTRACETitle = { fg = C.hint, styles = { "italic" } },
	}
end

return M

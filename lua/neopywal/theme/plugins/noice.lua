local M = {}

function M.get()
	-- folke/noice.nvim
	return {
		NoiceCmdlinePopup = { link = "NormalFloat" },

		NoiceMini = { link = "NoiceLspProgressTitle" },
		NoiceLspProgressTitle = { bg = U.darken(C.background, 8), fg = C.foreground },
		NoiceLspProgressClient = {
			bg = U.darken(C.background, 8),
			fg = C.color4,
			styles = { "bold" },
		},
		NoiceLspProgressSpinner = { link = "NoiceLspProgressClient" },
		NoiceFormatProgressDone = { bg = U.darken(C.background, 8) },
		NoiceFormatProgressTodo = { bg = U.darken(C.background, 8) },

		NoiceConfirm = { link = "NormalFloat" },
		NoiceConfirmBorder = { link = "FloatTitle" },

		NoiceCmdlineIcon = { fg = C.color2 },
		NoiceCmdlinePopupBorderCmdline = { link = "NoiceCmdlineIcon" },

		NoiceCmdlineIconSearch = { fg = U.blend(C.color1, C.color3, 0.5) },
		NoiceCmdlinePopupBorderSearch = { link = "NoiceCmdlineIconSearch" },

		NoiceCmdlineIconHelp = { fg = C.color3 },
		NoiceCmdlinePopupBorderHelp = { link = "NoiceCmdlineIconHelp" },

		NoiceCmdlineIconLua = { fg = C.color4 },
		NoiceCmdlinePopupBorderLua = { link = "NoiceCmdlineIconLua" },

		NoiceCmdlineIconCalculator = { fg = C.color6 },
		NoiceCmdlinePopupBorderCalculator = { link = "NoiceCmdlineIconCalculator" },

		NoiceCmdlineIconIncRename = { fg = C.color5 },
		NoiceCmdlinePopupBorderIncRename = { link = "NoiceCmdlinePopupBorder" },

		NoiceCmdlineIconInput = { fg = C.foreground },
		NoiceCmdlinePopupBorderInput = { link = "NoiceCmdlineIconInput" },

		NoiceCmdlineIconFilter = { fg = C.color1 },
		NoiceCmdlinePopupBorderFilter = { link = "NoiceCmdlineIconFilter" },
	}
end

return M

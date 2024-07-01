local M = {}

function M.get()
	-- folke/noice.nvim
	-- Honestly the default integration is already pretty good.
	return {
		NoiceCmdlinePopup = { link = "NormalFloat" },

		NoiceMini = { link = "NoiceLspProgressTitle" },
		NoiceLspProgressTitle = { bg = C.background, fg = C.foreground },
		NoiceLspProgressClient = {
			bg = C.background,
			fg = C.color4,
			styles = { "bold" },
		},
		NoiceLspProgressSpinner = { link = "NoiceLspProgressClient" },
		NoiceFormatProgressDone = { bg = C.background },
		NoiceFormatProgressTodo = { bg = C.background },

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
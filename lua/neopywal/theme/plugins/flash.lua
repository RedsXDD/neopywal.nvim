local M = {}

function M.get()
	-- folke/flash.nvim
	local bg = O.transparent_background and C.none or C.dim_bg
	return {
		FlashBackdrop = { fg = C.comment },
		FlashMatch = { bg = bg, fg = C.color5, styles = O.plugins.flash.style or {} },
		FlashLabel = { bg = bg, fg = C.color2, styles = O.plugins.flash.style or {} },
		FlashPrompt = { link = "NormalFloat" },
		FlashPromptIcon = { fg = C.special },
		FlashCurrent = { bg = bg, fg = C.color4, styles = O.plugins.flash.style or {} },
	}
end

return M

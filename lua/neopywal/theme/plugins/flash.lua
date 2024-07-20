local M = {}

function M.get()
	-- folke/flash.nvim
	local bg = O.transparent_background and C.none or C.background
	return {
		FlashBackdrop = { fg = C.comment },
		FlashMatch = { fg = C.color5, bg = bg, styles = O.plugins.flash.style or {} },
		FlashLabel = { fg = C.color2, bg = bg, styles = O.plugins.flash.style or {} },
		FlashPrompt = { link = "NormalFloat" },
		FlashPromptIcon = { fg = C.special },
		FlashCurrent = { fg = C.color4, bg = bg, styles = O.plugins.flash.style or {} },
	}
end

return M

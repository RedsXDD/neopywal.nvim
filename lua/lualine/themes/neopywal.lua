-- Lualine variable formatting:
-- +-------------------------------------------------+
-- | A | B | C                             X | Y | Z |
-- +-------------------------------------------------+

local U = require("neopywal.util")
local colors = require("neopywal").get_colors()

-- Fix background colors for separators on the edge of statusline.
vim.api.nvim_set_hl(0, "StatusLine", { bg = colors.background, fg = colors.foreground })

local neopywal = {}

neopywal.normal = {
	a = { bg = colors.color4, fg = colors.background, gui = "bold" },
	z = { bg = colors.color4, fg = colors.background, gui = "bold" },

	b = { bg = U.blend(colors.color8, colors.background, 0.5), fg = colors.foreground, gui = "bold" },
	y = { bg = U.blend(colors.color8, colors.background, 0.5), fg = colors.foreground, gui = "bold" },

	c = { bg = U.blend(colors.color8, colors.background, 0.3), fg = colors.foreground, gui = "bold" },
	x = { bg = U.blend(colors.color8, colors.background, 0.3), fg = colors.foreground, gui = "bold" },
}

neopywal.visual = {
	a = { bg = colors.color5, fg = colors.background, gui = "bold" },
	z = { bg = colors.color5, fg = colors.background, gui = "bold" },
}

neopywal.insert = {
	a = { bg = colors.color6, fg = colors.background, gui = "bold" },
	z = { bg = colors.color6, fg = colors.background, gui = "bold" },
}

neopywal.command = {
	a = { bg = colors.color1, fg = colors.background, gui = "bold" },
	z = { bg = colors.color1, fg = colors.background, gui = "bold" },
}

neopywal.replace = {
	a = { bg = colors.color2, fg = colors.background, gui = "bold" },
	z = { bg = colors.color2, fg = colors.background, gui = "bold" },
}

neopywal.terminal = {
	a = { bg = colors.color3, fg = colors.background, gui = "bold" },
	z = { bg = colors.color3, fg = colors.background, gui = "bold" },
}

neopywal.inactive = {
	a = { bg = colors.background, fg = colors.foreground, gui = "bold" },
	z = { bg = colors.background, fg = colors.foreground, gui = "bold" },
}

return neopywal

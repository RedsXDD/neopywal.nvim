-- Lualine variable formatting:
-- +-------------------------------------------------+
-- | A | B | C                             X | Y | Z |
-- +-------------------------------------------------+

local M = {}
local U = require("neopywal.utils.color")
local C = require("neopywal").get_colors()

-- Fix background colors for separators on the edge of statusline.
vim.api.nvim_set_hl(0, "StatusLine", { bg = C.background, fg = C.foreground })

function M.get()
	local neopywal = {}

	neopywal.normal = {
		a = { bg = C.color4, fg = C.background, gui = "bold" },
		z = { bg = C.color4, fg = C.background, gui = "bold" },

		b = { bg = U.blend(C.color8, C.background, 0.5), fg = C.foreground, gui = "bold" },
		y = { bg = U.blend(C.color8, C.background, 0.5), fg = C.foreground, gui = "bold" },

		c = { bg = U.blend(C.color8, C.background, 0.3), fg = C.foreground, gui = "bold" },
		x = { bg = U.blend(C.color8, C.background, 0.3), fg = C.foreground, gui = "bold" },
	}

	neopywal.visual = {
		a = { bg = C.color5, fg = C.background, gui = "bold" },
		z = { bg = C.color5, fg = C.background, gui = "bold" },
	}

	neopywal.insert = {
		a = { bg = C.color6, fg = C.background, gui = "bold" },
		z = { bg = C.color6, fg = C.background, gui = "bold" },
	}

	neopywal.command = {
		a = { bg = C.color1, fg = C.background, gui = "bold" },
		z = { bg = C.color1, fg = C.background, gui = "bold" },
	}

	neopywal.replace = {
		a = { bg = C.color2, fg = C.background, gui = "bold" },
		z = { bg = C.color2, fg = C.background, gui = "bold" },
	}

	neopywal.terminal = {
		a = { bg = C.color3, fg = C.background, gui = "bold" },
		z = { bg = C.color3, fg = C.background, gui = "bold" },
	}

	neopywal.inactive = {
		a = { bg = C.background, fg = C.foreground, gui = "bold" },
		z = { bg = C.background, fg = C.foreground, gui = "bold" },
	}

	return neopywal
end

return M

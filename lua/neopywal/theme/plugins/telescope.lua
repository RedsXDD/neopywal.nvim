local M = {}

function M.get()
	-- nvim-telescope/telescope.nvim
	return O.plugins.telescope.style ~= nil
			and string.lower(O.plugins.telescope.style) == "nvchad"
			and not O.transparent_background
			and {
				TelescopeBorder = {
					bg = O.dim_inactive and C.background or U.darken(C.background, 5),
					fg = O.dim_inactive and C.background or U.darken(C.background, 5),
				},
				TelescopeNormal = {
					bg = O.dim_inactive and C.background or U.darken(C.background, 5),
				},
				TelescopePromptBorder = {
					bg = O.dim_inactive and U.darken(C.background, 5) or U.blend(C.background, "#000000", 0.8),
					fg = O.dim_inactive and U.darken(C.background, 5) or U.blend(C.background, "#000000", 0.8),
				},
				TelescopePromptNormal = {
					bg = O.dim_inactive and U.darken(C.background, 5) or U.blend(C.background, "#000000", 0.8),
					fg = C.foreground,
				},
				TelescopePromptPrefix = {
					bg = O.dim_inactive and U.darken(C.background, 5) or U.blend(C.background, "#000000", 0.8),
					fg = C.color4,
					styles = { "bold" },
				},
				TelescopePreviewTitle = {
					bg = C.color3,
					fg = U.blend(C.color8, C.background, 0.4),
				},
				TelescopePromptTitle = {
					bg = C.color4,
					fg = U.blend(C.color8, C.background, 0.4),
				},
				TelescopeResultsTitle = {
					bg = C.color6,
					fg = O.dim_inactive and C.background or U.darken(C.background, 5),
				},
				TelescopeSelection = { link = "CursorLine" },
				TelescopeSelectionCaret = { bg = U.blend(C.background, C.foreground, 0.9), fg = C.color6 },
			}
		or {
			TelescopeSelection = { link = "CursorLine" },
			TelescopePromptBorder = { link = "TelescopeBorder" },
			TelescopePromptPrefix = { fg = C.color4, styles = { "bold" } },
			TelescopePreviewTitle = { fg = C.color3 },
			TelescopePromptTitle = { fg = C.color4 },
			TelescopeResultsTitle = { fg = C.color6 },
			TelescopeSelectionCaret = { bg = U.blend(C.background, C.foreground, 0.9), fg = C.color6 },
		}
end

return M

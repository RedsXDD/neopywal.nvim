local M = {}

function M.get()
	-- nvim-telescope/telescope.nvim
	return O.plugins.telescope.style ~= nil
			and string.lower(O.plugins.telescope.style) == "nvchad"
			and not O.transparent_background
			and {
				TelescopeBorder = {
					bg = O.dim_inactive and C.background or U.blend(C.background, "#000000", 0.8),
					fg = O.dim_inactive and C.background or U.blend(C.background, "#000000", 0.8),
				},
				TelescopeNormal = {
					bg = O.dim_inactive and C.background or U.blend(C.background, "#000000", 0.8),
				},
				TelescopePromptBorder = {
					bg = U.blend(C.background, C.foreground, 0.9),
					fg = U.blend(C.background, C.foreground, 0.9),
				},
				TelescopePromptNormal = {
					bg = U.blend(C.background, C.foreground, 0.9),
					fg = C.foreground,
				},
				TelescopePromptPrefix = {
					bg = U.blend(C.background, C.foreground, 0.9),
					fg = C.color4,
					styles = { "bold" },
				},
				TelescopePreviewTitle = {
					bg = C.color3,
					fg = C.background,
				},
				TelescopePromptTitle = {
					bg = C.color4,
					fg = C.background,
				},
				TelescopeResultsTitle = {
					bg = C.color6,
					fg = C.background,
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

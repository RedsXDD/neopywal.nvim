local M = {}

function M.get()
	local hex_chars = "[abcdef0-9][abcdef0-9]"
	local pattern = "^#(" .. hex_chars .. ")(" .. hex_chars .. ")(" .. hex_chars .. ")$"

	local winsep_color = O.plugins.colorful_winsep.color
	winsep_color = winsep_color ~= "" and winsep_color or C.color4
	winsep_color = string.lower(winsep_color)
	winsep_color = string.find(winsep_color, pattern) ~= nil and winsep_color
		or C[winsep_color] ~= nil and C[winsep_color]
		or C.color4

	return {
		NvimSeparator = {
			bg = O.transparent_background and C.none or O.dim_inactive and C.dim_bg or C.background,
			fg = winsep_color,
		},
	}
end

return M

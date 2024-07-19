local M = {}

function M.get()
	-- lukas-reineke/indent-blankline.nvim
	local hex_chars = "[abcdef0-9][abcdef0-9]"
	local pattern = "^#(" .. hex_chars .. ")(" .. hex_chars .. ")(" .. hex_chars .. ")$"

	local scope_color = O.plugins.indent_blankline.scope_color
	scope_color = scope_color ~= "" and scope_color or C.comment
	scope_color = string.lower(scope_color)
	scope_color = string.find(scope_color, pattern) ~= nil and scope_color
		or C[scope_color] ~= nil and C[scope_color]
		or C.comment

	return {
		IblIndent = { fg = scope_color },
		IblScope = { link = "IblIndent" },
	}
end

return M

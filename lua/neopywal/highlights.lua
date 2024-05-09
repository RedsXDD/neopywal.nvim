local M = {}

function M.apply_highlights(colors)
	local base_highlights = require("neopywal.config").get_highlights(colors)
	for group, properties in pairs(base_highlights) do
		vim.api.nvim_set_hl(0, group, properties)
	end
end

return M

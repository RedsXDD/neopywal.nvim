local M = {}
local core = require("neopywal.core")
local highlights = require("neopywal.highlights")

function M.setup()
	local colors = core.get_colors()
	vim.opt.termguicolors = true
	highlights.highlight_all(colors)
end

return M

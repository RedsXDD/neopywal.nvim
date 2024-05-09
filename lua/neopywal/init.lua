local M = {}

function M.get_colors()
	vim.cmd [[ source $HOME/.cache/wal/colors-wal.vim ]]

	return {
		transparent = "NONE",
		background = vim.g.background,
		foreground = vim.g.foreground,
		cursor = vim.g.cursor,
		color0 = vim.g.color0,
		color1 = vim.g.color1,
		color2 = vim.g.color2,
		color3 = vim.g.color3,
		color4 = vim.g.color4,
		color5 = vim.g.color5,
		color6 = vim.g.color6,
		color7 = vim.g.color7,
		color8 = vim.g.color8,
		color9 = vim.g.color9,
		color10 = vim.g.color10,
		color11 = vim.g.color11,
		color12 = vim.g.color12,
		color13 = vim.g.color13,
		color14 = vim.g.color14,
		color15 = vim.g.color15,
	}
end

local function apply_highlights(colors)
	local base_highlights = require("neopywal.config").get_highlights(colors)
	for group, properties in pairs(base_highlights) do
		vim.api.nvim_set_hl(0, group, properties)
	end
end

function M.setup()
	local colors = M.get_colors()
	vim.opt.termguicolors = true
	apply_highlights(colors)
end

return M

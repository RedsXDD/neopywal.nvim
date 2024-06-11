local M = {}

local default_options = {
	-- Uses a template file `~/.cache/wallust/colors_neopywal.vim` instead of the regular
	-- pywal template at `~/.cache/wal/colors-wal.vim`
	use_wallust = false,

	-- Sets the background color of certain highlight groups to be transparent.
	-- Use this when your terminal opacity is < 1.
	transparent_background = false,

	-- With this option you can overwrite all the base colors the colorscheme uses.
	custom_colors = {},

	-- With this option you can overwrite any highlight groups set by the colorscheme.
	custom_highlights = {},

	-- Dims the background when another window is focused.
	dim_inactive = true,

	-- Apply colorscheme for Neovim's terminal (e.g. `g:terminal_color_0`).
	terminal_colors = true,

	-- Shows the '~' characters after the end of buffers.
	show_end_of_buffer = false,

	-- Setting this to false disables all default file format highlights.
	-- Useful if you want to enable specific file format options.
	default_fileformats = true,

	-- Setting this to false disables all default plugin highlights.
	-- Useful if you want to enable specific plugin options.
	default_plugins = true,

	fileformats = {
		c_cpp = true,
		clojure = true,
		cmake = true,
		git_commit = true,
		c_sharp = true,
		css = true,
		dart = true,
		diff = true,
		elixir = true,
		erlang = true,
		go = true,
		haskell = true,
		help = true,
		html = true,
		ini = true,
		java = true,
		json = true,
		javascript_react = true,
		javascript = true,
		kotlin = true,
		latex = true,
		less = true,
		common_lisp = true,
		lua = true,
		makefile = true,
		markdown = true,
		matlab = true,
		objectivec = true,
		ocaml = true,
		perl = true,
		php = true,
		powershell = true,
		python = true,
		restructuredtext = true,
		ruby = true,
		rust = true,
		sass = true,
		scala = true,
		shell = true,
		swift = true,
		toml = true,
		typescript = true,
		viml = true,
		xml = true,
		yaml = true,
		zsh = true,
	},
	plugins = {
		ale = true,
		alpha = true,
		nvim_cmp = true,
		coc = true,
		dashboard = true,
		git_gutter = true,
		indent_blankline = true,
		lazy = true,
		lspconfig = true,
		neotree = true,
		netrw = true,
		telescope = true,
		treesitter = true,
		undotree = true,
		which_key = true,
		mini = {
			cursorword = true,
			files = true,
			hipatterns = true,
			indentscope = true,
			pick = true,
			starter = true,
			statusline = true,
			tabline = true,
		},
	},
}
M.options = default_options

function M.get_colors()
	---@diagnostic disable: param-type-mismatch
	local colorscheme_file = ""
	if M.options.use_wallust then
		colorscheme_file = "$HOME/.cache/wallust/colors_neopywal.vim"
	else
		colorscheme_file = "$HOME/.cache/wal/colors-wal.vim"
	end

	if not pcall(vim.cmd, "source " .. colorscheme_file) then
		vim.notify(
			"Neopywal: Colorscheme file "
				.. colorscheme_file
				.. " could not be loaded, falling back to builtin colorscheme.",
			vim.log.levels.WARN
		)

		-- Reference: https://github.com/catppuccin/catppuccin
		vim.cmd([[
			let background = "#1E1E2E",
			let foreground = "#CDD6F4",
			let cursor = "#F5E0DC",
			let color0 = "#45475A",
			let color1 = "#F38BA8",
			let color2 = "#A6E3A1",
			let color3 = "#F9E2AF",
			let color4 = "#89B4FA",
			let color5 = "#F5C2E7",
			let color6 = "#94E2D5",
			let color7 = "#BAC2DE",
			let color8 = "#585B70",
			let color9 = "#F38BA8",
			let color10 = "#A6E3A1",
			let color11 = "#F9E2AF",
			let color12 = "#89B4FA",
			let color13 = "#F5C2E7",
			let color14 = "#94E2D5",
			let color15 = "#A6ADC8",
		]])
	end

	local user_colors = M.options.custom_colors
	return vim.tbl_deep_extend("keep", {}, user_colors, {
		none = "NONE",
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
	})
end

local did_setup = false
function M.load()
	if not did_setup then
		M.setup()
	end

	local colors = M.get_colors()
	vim.opt.termguicolors = true

	local user_highlights = M.options.custom_highlights
	if type(user_highlights) == "function" then
		user_highlights = user_highlights(colors)
	end

	if M.options.terminal_colors == true then
		local terminal_theme = require("neopywal.theme.terminal").get(colors)
		for color_option, color in pairs(terminal_theme) do
			vim.g[color_option] = color
		end
	end

	local theme = vim.tbl_deep_extend(
		"keep",
		{},
		user_highlights,
		require("neopywal.theme.editor").get(colors),
		require("neopywal.theme.fileformats").get(colors),
		require("neopywal.theme.plugins").get(colors),
		M.options.plugins.treesitter and require("neopywal.theme.treesitter").get(colors) or {},
		{}
	)

	for highlight_group, properties in pairs(theme) do
		vim.api.nvim_set_hl(0, highlight_group, properties)
	end
end

function M.setup(user_conf)
	did_setup = true

	-- Load user configuration:
	user_conf = user_conf or {}
	if user_conf.default_fileformats == false then
		default_options.fileformats = {}
	end

	if user_conf.default_plugins == false then
		default_options.plugins = {}
	end

	M.options =
		vim.tbl_deep_extend("keep", {}, vim.g.neovide and { transparent = false } or {}, user_conf, default_options)
end

return M

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

	no_italic = false, -- Force no italic.
	no_bold = false, -- Force no bold.
	no_underline = false, -- Force no underline.
	no_undercurl = false, -- Force no undercurl.
	no_strikethrough = false, -- Force no strikethrough.

	-- Handles the styles of general hi groups (see `:h highlight-args`).
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		includes = { "italic" },
		strings = {},
		variables = { "italic" },
		numbers = {},
		booleans = {},
		-- properties = {},
		types = { "italic" },
		operators = {},
	},

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
		noice = true,
		ale = true,
		alpha = true,
		nvim_cmp = true,
		lazygit = true,
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

--: M.get_colors() explanation {{{
--[[
	Returns a table of colors to be used by the plugin.

	The get_colors function determines the colors to use by Neopywal based on the user's configuration and
	the default colors set by the Pywal/Wallust colorscheme file.

	It first checks if the user has opted to use the Wallust colorscheme, and
	sources the corresponding colorscheme file. If the file cannot be loaded,
	it notifies the user and then falls back to a built-in catppuccin colorscheme.

	The function then merges the user's custom colors (if any) with the determined
	colors and returns a colors dictionary table.

	The returned table contains the following colors:
	- none
	- transparent
	- background
	- foreground
	- cursor
	- color0 to color15
	- any additional color variable set by the user.
--]]
--: }}}
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

--: M.load() explanation {{{
--[[
	The M.load function is responsible for loading the Neopywal colorscheme.
	It sets up the colorscheme, clears any existing highlights, and applies
	the theme to the editor.
	It requires the M.setup function to have been called previously.
	This is the function that gets called when running `:colorscheme neopywal`.
--]]
--: }}}
local did_setup = false
function M.load()
	-- Ensure setup() has been called.
	if not did_setup then
		M.setup()
	end

	-- Clear existing highlights if not using the default colorscheme.
	if vim.g.colors_name then
		vim.cmd.hi("clear")
	end
	vim.g.colors_name = "neopywal"

	vim.o.termguicolors = true
	local colors = M.get_colors()

	-- Get user-defined highlights.
	local user_highlights = M.options.custom_highlights
	if type(user_highlights) == "function" then
		user_highlights = user_highlights(colors)
	end

	-- Apply terminal colors if enabled.
	if M.options.terminal_colors == true then
		local terminal_theme = require("neopywal.theme.terminal").get(colors)
		for color_option, color in pairs(terminal_theme) do
			vim.g[color_option] = color
		end
	end

	-- Create the theme table by merging user highlights, editor, file formats, plugins, and treesitter theme tables.
	local theme = vim.tbl_deep_extend(
		"keep",
		user_highlights,
		require("neopywal.theme.editor").get(colors),
		require("neopywal.theme.fileformats").get(colors),
		require("neopywal.theme.plugins").get(colors),
		M.options.plugins.treesitter and require("neopywal.theme.treesitter").get(colors) or {},
		{}
	)

	-- Apply the theme to Neovim by iterating over each highlight group and its corresponding properties.
	for highlight_group, properties in pairs(theme) do
		-- This if statement applies styles to a highlight group, taking into account user options to disable certain styles.
		-- It iterates over each style in the styles table in the highlight group, sets them to true by default,
		-- and overrides them to false if the corresponding option is set to disable the style.
		if properties.styles then
			for _, style in pairs(properties.styles) do
				properties[style] = true

				-- Override the italic style if the no_italic option is set to false.
				if M.options.no_italic and style == "italic" then
					properties[style] = false
				end

				-- Override the bold style if the no_bold option is set to false.
				if M.options.no_bold and style == "bold" then
					properties[style] = false
				end

				-- Override the underline style if the no_underline option is set to false.
				if M.options.no_underline and style == "underline" then
					properties[style] = false
				end

				-- Override the undercurl style if the no_undercurl option is set to false.
				if M.options.no_undercurl and style == "undercurl" then
					properties[style] = false
				end

				-- Override the strikethrough style if the no_strikethrough option is set to false.
				if M.options.no_strikethrough and style == "strikethrough" then
					properties[style] = false
				end
			end
		end

		-- Remove the styles table to avoid passing unnecessary data to vim.api.nvim_set_hl.
		properties.styles = nil

		vim.api.nvim_set_hl(0, highlight_group, properties)
	end
end

--: M.setup() explanation {{{
--[[
	The setup function initializes the plugin configuration by merging user-provided settings with default options,
	overwritting any default options with the user configuration.

	If the user configuration specifies default_fileformats or default_plugins as false, all of the
	corresponding default options for the fileformats/plugins tables will be reset.

	The function also disabled the transparent option by default if the plugin is being ran inside Neovide.
	Since Neovide doesn't handle transparancy properly, having such option enable would make all the transparent colors black by default.
--]]
--: }}}
function M.setup(user_conf)
	did_setup = true

	-- Load user configuration.
	user_conf = user_conf or {}

	-- Disabled all fileformats options if default_fileformats != true.
	if user_conf.default_fileformats == false then
		default_options.fileformats = {}
	end

	-- Disabled all plugins options if default_plugins != true.
	if user_conf.default_plugins == false then
		default_options.plugins = {}
	end

	-- Create the final configuration table by combining user settings, default options, and Neovide settings
	M.options = vim.tbl_deep_extend("keep", vim.g.neovide and { transparent_background = false } or {}, user_conf, default_options)
end

return M

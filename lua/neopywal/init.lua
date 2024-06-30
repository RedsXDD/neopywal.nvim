local M = {}

---@diagnostic disable-next-line: undefined-global
local path_sep = jit and (jit.os == "Windows" and "\\" or "/") or package.config:sub(1, 1)
local compile_path = vim.fn.stdpath("cache") .. "/neopywal"
local compiled_filename = "neopywal"

local default_options = {
	-- Uses a template file `~/.cache/wallust/colors_neopywal.vim` instead of the regular
	-- pywal template at `~/.cache/wal/colors-wal.vim`
	use_wallust = false,

	-- This option allows to specify where Neopywal should look for a ".vim" template file.
	colorscheme_file = "", -- e.g.: "~/.cache/wal/custom_neopywal_template.vim".

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

	-- Shows the '|' split separator characters.
	-- It's worth noting that this options works better in conjunction with `dim_inactive`.
	show_split_lines = true,

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
	-- NOTE: if the treesitter plugin integration is enabled, this option
	-- will be automatically set to false unless the user manually sets it back on
	-- using the setup() function.
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
		coc = true,
		dashboard = true,
		git_gutter = true,
		indent_blankline = true,
		lazy = true,
		lazygit = true,
		lspconfig = true,
		neotree = true,
		netrw = true,
		noice = true,
		notify = true,
		nvim_cmp = true,
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
	if type(M.options.colorscheme_file) ~= "string" then
		error("NEOPYWAL: `colorscheme_file` option must be of type string.")
	end

	local colorscheme_file = ""
	if M.options.colorscheme_file ~= "" then
		colorscheme_file = M.options.colorscheme_file
	elseif M.options.use_wallust then
		colorscheme_file = "$HOME/.cache/wallust/colors_neopywal.vim"
	else
		colorscheme_file = "$HOME/.cache/wal/colors-wal.vim"
	end

	---@diagnostic disable-next-line: param-type-mismatch
	local has_colorscheme_file, _ = pcall(vim.cmd, "source " .. colorscheme_file)
	if not has_colorscheme_file then
		vim.notify(
			"Neopywal (ERROR): Colorscheme file "
				.. colorscheme_file
				.. " could not be loaded, falling back to builtin catppuccin colorscheme.",
			vim.log.levels.WARN
		)
	end

	-- Fallback colors reference: https://github.com/catppuccin/catppuccin
	local pywal_colors = {
		none = "NONE",
		background = (vim.g.background ~= nil) and vim.g.background or "#1E1E2E",
		foreground = (vim.g.foreground ~= nil) and vim.g.foreground or "#CDD6F4",
		cursor = (vim.g.cursor ~= nil) and vim.g.cursor or "#F5E0DC",
		color0 = (vim.g.color0 ~= nil) and vim.g.color0 or "#45475A",
		color1 = (vim.g.color1 ~= nil) and vim.g.color1 or "#F38BA8",
		color2 = (vim.g.color2 ~= nil) and vim.g.color2 or "#A6E3A1",
		color3 = (vim.g.color3 ~= nil) and vim.g.color3 or "#F9E2AF",
		color4 = (vim.g.color4 ~= nil) and vim.g.color4 or "#89B4FA",
		color5 = (vim.g.color5 ~= nil) and vim.g.color5 or "#F5C2E7",
		color6 = (vim.g.color6 ~= nil) and vim.g.color6 or "#94E2D5",
		color7 = (vim.g.color7 ~= nil) and vim.g.color7 or "#BAC2DE",
		color8 = (vim.g.color8 ~= nil) and vim.g.color8 or "#585B70",
		color9 = (vim.g.color9 ~= nil) and vim.g.color9 or "#F38BA8",
		color10 = (vim.g.color10 ~= nil) and vim.g.color10 or "#A6E3A1",
		color11 = (vim.g.color11 ~= nil) and vim.g.color11 or "#F9E2AF",
		color12 = (vim.g.color12 ~= nil) and vim.g.color12 or "#89B4FA",
		color13 = (vim.g.color13 ~= nil) and vim.g.color13 or "#F5C2E7",
		color14 = (vim.g.color14 ~= nil) and vim.g.color14 or "#94E2D5",
		color15 = (vim.g.color15 ~= nil) and vim.g.color15 or "#A6ADC8",
	}

	-- Reset global variables:
	vim.g.background = nil
	vim.g.foreground = nil
	vim.g.cursor = nil
	vim.g.color0 = nil
	vim.g.color1 = nil
	vim.g.color2 = nil
	vim.g.color3 = nil
	vim.g.color4 = nil
	vim.g.color5 = nil
	vim.g.color6 = nil
	vim.g.color7 = nil
	vim.g.color8 = nil
	vim.g.color9 = nil
	vim.g.color10 = nil
	vim.g.color11 = nil
	vim.g.color12 = nil
	vim.g.color13 = nil
	vim.g.color14 = nil
	vim.g.color15 = nil

	local user_colors = M.options.custom_colors
	return vim.tbl_deep_extend("keep", user_colors, pywal_colors)
end

local function sum_colors()
	local U = require("neopywal.util")
	local colors = M.get_colors()

	local tbl = {
		colors.background,
		colors.foreground,
		-- colors.cursor,
		-- colors.color0,
		colors.color1,
		colors.color2,
		colors.color3,
		colors.color4,
		colors.color5,
		colors.color6,
		colors.color7,
		colors.color8,
		-- colors.color9,
		-- colors.color10,
		-- colors.color11,
		-- colors.color12,
		-- colors.color13,
		-- colors.color14,
		-- colors.color15,
	}

	local sum = 0
	for _, color in pairs(tbl) do
		if type(color) == "string" and color:match("#(%x%x)(%x%x)(%x%x)") then
			local rgb = U.hexToRgb(color)
			sum = sum + rgb[1] + rgb[2] + rgb[3]
		end
	end

	return sum
end

local did_setup = false
function M.load()
	-- Ensure setup() has been called.
	if not did_setup then
		M.setup()
	end

	local compiled_path = compile_path .. path_sep .. compiled_filename
	local f = loadfile(compiled_path)
	if not f then
		require("neopywal.compiler").compile(compile_path, path_sep, compiled_filename)
		f = assert(loadfile(compiled_path), "could not load cache")
	end
	f(compiled_filename)
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

	-- Create the final configuration table by combining user settings, default options, and Neovide settings
	M.options = vim.tbl_deep_extend(
		"keep",
		vim.g.neovide and { transparent_background = false } or {},
		user_conf,
		default_options
	)

	-- Disable default plugins options if default_plugins != true.
	if M.options.default_plugins == false then
		M.options.plugins = user_conf.plugins or {}
	end

	-- Disable default fileformats options if treesitter is enabled (unless the user manually specifies otherwise).
	if M.options.plugins.treesitter and not user_conf.default_fileformats then
		M.options.default_fileformats = false
	end

	-- Disable default fileformats options if default_fileformats != true.
	if M.options.default_fileformats == false then
		M.options.fileformats = user_conf.fileformats or {}
	end

	-- Get cached hash
	local cached_path = compile_path .. path_sep .. "cached"
	local file = io.open(cached_path)
	local cached = nil
	if file then
		cached = file:read()
		file:close()
	end

	-- Get current hash
	local git_path = debug.getinfo(1).source:sub(2, -22) .. ".git"
	local git = vim.fn.getftime(git_path) -- 2x faster vim.loop.fs_stat
	local hash = require("neopywal.hashing").hash(user_conf)
		.. (git == -1 and git_path or git) -- no .git in /nix/store -> cache path
		.. (vim.o.winblend == 0 and 1 or 0) -- :h winblend
		.. (vim.o.pumblend == 0 and 1 or 0) -- :h pumblend
		.. sum_colors()

	-- Recompile if hash changed
	if cached ~= hash then
		require("neopywal.compiler").compile(compile_path, path_sep, compiled_filename)
		file = io.open(cached_path, "wb")
		if file then
			file:write(hash)
			file:close()
		end
	end
end

vim.api.nvim_create_user_command("NeopywalCompile", function()
	for name, _ in pairs(package.loaded) do
		if name:match("^neopywal.") then
			package.loaded[name] = nil
		end
	end
	require("neopywal.compiler").compile(compile_path, path_sep, compiled_filename)
	vim.notify("Neopywal (INFO): Successfully compiled cache.", vim.log.levels.INFO)
	vim.cmd.colorscheme("neopywal")
end, {})

if vim.g.neopywal_debug then
	vim.api.nvim_create_autocmd("BufWritePost", {
		pattern = "*/neopywal/*",
		callback = function()
			vim.schedule(function()
				vim.cmd("NeopywalCompile")
			end)
		end,
	})
end

return M

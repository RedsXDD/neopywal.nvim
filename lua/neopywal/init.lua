local M = {}
local U = require("neopywal.utils.color")
local notify = require("neopywal.lib.notify")
local compiler = require("neopywal.lib.compiler")

M.compiler = {
	---@diagnostic disable-next-line: undefined-global
	path_sep = jit and (jit.os == "Windows" and "\\" or "/") or package.config:sub(1, 1),
	filename = "neopywal",
	compile_path = vim.fn.stdpath("cache") .. "/neopywal",
}
local G = M.compiler

M.default_options = {
	-- Uses a template file `~/.cache/wallust/colors_neopywal.vim` instead of the regular
	-- pywal template at `~/.cache/wal/colors-wal.vim`
	use_wallust = false,

	-- This option allows to specify where Neopywal should look for a ".vim" template file.
	colorscheme_file = "", -- e.g.: os.getenv("HOME") .. "/.cache/wal/custom_neopywal_template.vim".

	-- This option allows to use a custom built-in theme palettes like "catppuccin-mocha" or "tokyonight".
	-- To get the list of available themes take a look at `:h neopywal-alternative-palettes` or at
	-- `https://github.com/RedsXDD/neopywal.nvim#Alternative-Palettes`.
	-- Take note that this option takes precedence over `use_wallust` and `colorscheme_file`.
	use_palette = "",

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

	-- Handles the styling of certain highlight groups (see `:h highlight-args`).
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
		types = { "italic" },
		operators = {},
		lsp = {
			virtual_text = {
				errors = { "bold", "italic" },
				hints = { "bold", "italic" },
				information = { "bold", "italic" },
				ok = { "bold", "italic" },
				warnings = { "bold", "italic" },
				unnecessary = { "bold", "italic" },
			},
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				information = { "undercurl" },
				ok = { "undercurl" },
				warnings = { "undercurl" },
			},
			inlay_hints = {
				background = true,
				style = { "bold", "italic" },
			},
		},
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
		c_sharp = true,
		clojure = true,
		cmake = true,
		common_lisp = true,
		css = true,
		dart = true,
		diff = true,
		elixir = true,
		erlang = true,
		git_commit = true,
		go = true,
		haskell = true,
		help = true,
		html = true,
		ini = true,
		java = true,
		javascript = true,
		javascript_react = true,
		json = true,
		kotlin = true,
		latex = true,
		less = true,
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
		alpha = true,
		coc = true,
		dashboard = true,
		git_gutter = true,
		indent_blankline = true,
		lazy = true,
		lazygit = true,
		lsp = true,
		neotree = true,
		netrw = true,
		noice = true,
		notify = true,
		nvim_cmp = true,
		telescope = {
			enabled = true,
			-- style = "nvchad",
		},
		treesitter = true,
		undotree = true,
		which_key = true,
		mini = {
			cursorword = true,
			files = true,
			hipatterns = true,
			icons = true,
			indentscope = true,
			pick = true,
			starter = true,
			statusline = true,
			tabline = true,
		},
	},
}
M.options = M.default_options

local function get_colorscheme_file()
	local cache_dir
	local colorscheme_file = ""
	local plugin_dir = debug.getinfo(1).source:sub(2, -22)
	local palette_dir = plugin_dir .. "palettes/"

	if G.path_sep == "\\" then
		cache_dir = os.getenv("LOCALAPPDATA") -- Windows
	else
		cache_dir = os.getenv("HOME") .. "/.cache" -- Linux/MacOS
	end

	-- stylua: ignore
	colorscheme_file = (type(M.options.use_palette) == "string" and M.options.use_palette ~= "") and "" .. palette_dir .. M.options.use_palette .. ".vim" or
                (type(M.options.colorscheme_file) == "string" and M.options.colorscheme_file ~= "") and M.options.colorscheme_file
		or M.options.use_wallust == true and cache_dir .. "/wallust/colors_neopywal.vim"
		or cache_dir .. "/wal/colors-wal.vim"

	if G.path_sep == "\\" then
		colorscheme_file = colorscheme_file:gsub("/", "\\")
	end

	return colorscheme_file
end

---@param theme_style? string
local function get_palette(theme_style)
	if not theme_style or theme_style ~= "dark" and theme_style ~= "light" then
		theme_style = vim.o.background
	end

	if type(M.options.colorscheme_file) ~= "string" then
		notify.error("`colorscheme_file` option must be of type string.")
	end

	if M.options.colorscheme_file == "" then
		M.options.colorscheme_file = get_colorscheme_file()
	end
	local colorscheme_file = M.options.colorscheme_file

	if vim.fn.filereadable(colorscheme_file) == 0 then
		notify.error(
			string.format(
				"Colorscheme file '%s' could not be found, falling back to the builtin colorscheme.",
				colorscheme_file
			)
		)
	else
		---@diagnostic disable-next-line: param-type-mismatch
		local could_load_file, error_msg = pcall(vim.cmd, "source " .. colorscheme_file)
		if not could_load_file then
			notify.error(string.format(
				[[
Unable to load the colorscheme file '%s', falling back to the builtin colorscheme.
Below is the error message that we captured:
%s]],
				colorscheme_file,
				error_msg
			))
		end
	end

	-- Use fallback colors if template file couldn't be loaded.
	-- Fallback colors reference: https://github.com/catppuccin/catppuccin
	local palette = {
		dark = {
			background = (vim.g.background ~= nil) and vim.g.background or "#1E1E2E",
			foreground = (vim.g.foreground ~= nil) and vim.g.foreground or "#CDD6F4",
		},
		light = {
			background = (vim.g.foreground ~= nil) and vim.g.foreground or "#CDD6F4",
			foreground = (vim.g.background ~= nil) and vim.g.background or "#1E1E2E",
		},
		colors = {
			none = "NONE",
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
		},
	}

	-- Reset all global variables that have been used.
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

	return vim.tbl_deep_extend("keep", palette[theme_style], palette.colors)
end

---@param theme_style? string
function M.get_colors(theme_style)
	if not theme_style or theme_style ~= "dark" and theme_style ~= "light" then
		theme_style = vim.o.background
	end
	local C = get_palette(theme_style)

	-- Extras:
	C.dim_bg = U.darken(C.background, 5)
	C.comment = C.color8
	C.cursorline = U.blend(C.background, C.foreground, 0.9)
	C.directory = C.color4

	-- Diffs:
	C.diff_added = C.color2
	C.diff_changed = C.color6
	C.diff_removed = C.color1
	C.diff_untracked = C.color5

	-- LSP/Diagnostics:
	C.error = C.color1
	C.hint = C.color6
	C.info = C.foreground
	C.unnecessary = C.color8
	C.warn = U.blend(C.color1, C.color3, 0.5)
	C.ok = C.color2
	C.inlay_hints = C.color8

	-- Variable types:
	C.variable = C.color4 -- (preferred) any variable.
	C.constant = C.color3 -- (preferred) any constant
	C.string = C.foreground -- a string constant: "this is a string"
	C.character = C.color3 -- a character constant: 'c', '\n'
	C.number = C.color5 -- a number constant: 234, 0xff
	C.boolean = C.color5 -- a boolean constant: TRUE, FALSE
	C.float = C.color5 -- a floating point constant: 2.3e10
	C.identifier = U.blend(C.color1, C.color3, 0.5) -- (preferred) any variable name
	C.func = C.color2 -- function name (also: methods for classes)

	-- Statements:
	C.statement = C.color1 -- (preferred) any statement
	C.conditional = C.color1 -- if, then, else, endif, switch, etc.
	C.loop = C.color1 -- for, do, while, etc.
	C.label = C.color1 -- case, default, etc.
	C.exception = C.color1 -- try, catch, throw
	C.operator = C.color1 -- "sizeof", "+", "*", etc.
	C.keyword = C.color1 -- any other keyword
	C.debug = C.color3 -- Debugging statements.

	-- Preprocessors:
	C.preproc = C.color5 -- (preferred) generic Preprocessor
	C.include = C.color5 -- preprocessor #include
	C.define = C.color5 -- preprocessor #define
	C.macro = C.color5 -- same as Define
	C.precondit = C.color5 -- preprocessor #if, #else, #endif, etc.

	-- Type definitions:
	C.type = C.color6 -- (preferred) int, long, char, etc.
	C.structure = C.color6 -- struct, union, enum, etc.
	C.storageclass = C.color6 -- static, register, volatile, etc.
	C.typedef = C.color6 -- A typedef

	-- Special:
	C.special = C.color5 -- (preferred) any special symbol
	C.secialchar = C.color5 -- special character in a constant
	C.tag = U.blend(C.color1, C.color3, 0.5) -- you can use CTRL-] on this
	C.delimiter = C.foreground -- character that needs attention
	C.specialcomment = C.color8 -- special things inside a comment

	local user_colors = M.options.custom_colors
	if type(user_colors) == "function" then
		user_colors = user_colors(C)
	end

	return vim.tbl_deep_extend("keep", {}, user_colors, C)
end

-- Avoid g:colors_name reloading
local lock = false
local did_setup = false
---@param style? string
function M.load(style)
	if lock then
		return
	end

	if not did_setup then
		M.setup()
	end

	local theme_style
	local bg = vim.o.background
	local style_bg = (style ~= "dark" and style ~= "light") and bg or style

	if style_bg ~= bg then
		if vim.g.colors_name == "neopywal-" .. style_bg then
			theme_style = (bg == "light" and style_bg == "dark") and "light" or "dark"
		else
			vim.o.background = style_bg
		end
	end

	M.current_style = theme_style or style_bg
	local filename = G.filename .. "-" .. M.current_style
	local compiled_path = G.compile_path .. G.path_sep .. filename

	lock = true
	local f = loadfile(compiled_path)
	if not f then
		compiler.compile()
		f = assert(loadfile(compiled_path), "could not load neopywal cache.")
	end
	f()
	lock = false
end

function M.setup(user_conf)
	-- Load user configuration.
	user_conf = user_conf or {}

	-- Create the final configuration table by overwritting the default table with the user config table.
	M.options = vim.tbl_deep_extend("keep", user_conf, M.default_options)

	-- Neovide doesn't play well with transparent background colors.
	if vim.g.neovide then
		M.options.transparent_background = false
	end

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

	-- Get cached hash.
	local cached_path = G.compile_path .. G.path_sep .. "cached"
	local file = io.open(cached_path)
	local cached = nil
	if file then
		cached = file:read()
		file:close()
	end

	-- Get current hash.
	local C = get_palette() -- Minimal palette table for hashing.
	local git_path = debug.getinfo(1).source:sub(2, -22) .. ".git"
	local git = vim.fn.getftime(git_path) -- 2x faster vim.loop.fs_stat
	local hash = require("neopywal.lib.hashing").hash(C)
		.. require("neopywal.lib.hashing").hash(user_conf)
		.. (git == -1 and git_path or git) -- no .git in /nix/store -> cache path
		.. (vim.o.winblend == 0 and 1 or 0) -- :h winblend
		.. (vim.o.pumblend == 0 and 1 or 0) -- :h pumblend

	-- Recompile if hash changed.
	if cached ~= hash then
		compiler.compile()
		file = io.open(cached_path, "wb")
		if file then
			file:write(hash)
			file:close()
		end
	end

	did_setup = true
end

vim.api.nvim_create_user_command("NeopywalCompile", function()
	for name, _ in pairs(package.loaded) do
		if name:match("^neopywal.") then
			package.loaded[name] = nil
		end
	end
	compiler.compile()
	notify.info("Successfully compiled cache.")
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

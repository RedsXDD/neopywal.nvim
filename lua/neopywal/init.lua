local M = {}
local notify = require("neopywal.lib.notify")

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

local already_notified = false
---@param theme_style? string
function M.get_colors(theme_style)
	local U = require("neopywal.utils.color")

	if type(M.options.colorscheme_file) ~= "string" then
		notify.error("`colorscheme_file` option must be of type string.")
	end

	local cache_dir
	if M.compiler.path_sep == "\\" then
		cache_dir = os.getenv("LOCALAPPDATA") -- Windows
	else
		cache_dir = os.getenv("HOME") .. "/.cache" -- Linux/MacOS
	end

	-- stylua: ignore
	local colorscheme_file = (type(M.options.colorscheme_file) == "string" and M.options.colorscheme_file ~= "")
		and M.options.colorscheme_file
		or M.options.use_wallust == true and cache_dir .. "/wallust/colors_neopywal.vim"
		or cache_dir .. "/wal/colors-wal.vim"

	if M.compiler.path_sep == "\\" then
		colorscheme_file = colorscheme_file:gsub("/", "\\")
	end

	if vim.fn.filereadable(colorscheme_file) == 0 and already_notified == false then
		notify.error(
			string.format(
				"Colorscheme file '%s' could not be found, falling back to the builtin colorscheme.",
				colorscheme_file
			)
		)
		already_notified = true
	else
		---@diagnostic disable-next-line: param-type-mismatch
		local could_load_file, error_msg = pcall(vim.cmd, "source " .. colorscheme_file)
		if not could_load_file and already_notified == false then
			notify.error(string.format(
				[[
Unable to load the colorscheme file '%s', falling back to the builtin colorscheme.
Below is the error message that we captured:
%s]],
				colorscheme_file,
				error_msg
			))
		end
		already_notified = true
	end

	-- If no notification was set, that means the colorscheme file can be successfully reused if needed.
	if already_notified == false then
		M.options.colorscheme_file = colorscheme_file
	end

	-- Use fallback colors if template file couldn't be loaded.
	-- Fallback colors reference: https://github.com/catppuccin/catppuccin
	vim.g.background = (vim.g.background ~= nil) and vim.g.background or "#1E1E2E"
	vim.g.foreground = (vim.g.foreground ~= nil) and vim.g.foreground or "#CDD6F4"
	vim.g.cursor = (vim.g.cursor ~= nil) and vim.g.cursor or "#F5E0DC"
	vim.g.color0 = (vim.g.color0 ~= nil) and vim.g.color0 or "#45475A"
	vim.g.color1 = (vim.g.color1 ~= nil) and vim.g.color1 or "#F38BA8"
	vim.g.color2 = (vim.g.color2 ~= nil) and vim.g.color2 or "#A6E3A1"
	vim.g.color3 = (vim.g.color3 ~= nil) and vim.g.color3 or "#F9E2AF"
	vim.g.color4 = (vim.g.color4 ~= nil) and vim.g.color4 or "#89B4FA"
	vim.g.color5 = (vim.g.color5 ~= nil) and vim.g.color5 or "#F5C2E7"
	vim.g.color6 = (vim.g.color6 ~= nil) and vim.g.color6 or "#94E2D5"
	vim.g.color7 = (vim.g.color7 ~= nil) and vim.g.color7 or "#BAC2DE"
	vim.g.color8 = (vim.g.color8 ~= nil) and vim.g.color8 or "#585B70"
	vim.g.color9 = (vim.g.color9 ~= nil) and vim.g.color9 or "#F38BA8"
	vim.g.color10 = (vim.g.color10 ~= nil) and vim.g.color10 or "#A6E3A1"
	vim.g.color11 = (vim.g.color11 ~= nil) and vim.g.color11 or "#F9E2AF"
	vim.g.color12 = (vim.g.color12 ~= nil) and vim.g.color12 or "#89B4FA"
	vim.g.color13 = (vim.g.color13 ~= nil) and vim.g.color13 or "#F5C2E7"
	vim.g.color14 = (vim.g.color14 ~= nil) and vim.g.color14 or "#94E2D5"
	vim.g.color15 = (vim.g.color15 ~= nil) and vim.g.color15 or "#A6ADC8"

	local function reset_global_color_variables()
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
	end

	local palette = {
		dark = {
			background = vim.g.background,
			foreground = vim.g.foreground,
		},
		light = {
			background = vim.g.foreground,
			foreground = vim.g.background,
		},
		colors = {
			none = "NONE",
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
		},
		lsp = {
			error = vim.g.color1,
			hint = vim.g.color6,
			info = vim.g.foreground,
			unnecessary = vim.g.color8,
			warn = U.blend(vim.g.color1, vim.g.color3, 0.5),
			ok = vim.g.color2,
			inlay_hints = vim.g.color8,
		},
	}

	if not theme_style or theme_style ~= "dark" and theme_style ~= "light" then
		theme_style = vim.o.background
	end

	reset_global_color_variables()
	local user_colors = M.options.custom_colors
	local colors = vim.tbl_deep_extend("keep", user_colors, palette[theme_style], palette.colors, palette.lsp)
	return colors
end

local function sum_colors()
	local U = require("neopywal.utils.color")
	local C = M.get_colors()

	local tbl = {
		C.background,
		C.foreground,
		-- C.cursor,
		-- C.color0,
		C.color1,
		C.color2,
		C.color3,
		C.color4,
		C.color5,
		C.color6,
		C.color7,
		C.color8,
		-- C.color9,
		-- C.color10,
		-- C.color11,
		-- C.color12,
		-- C.color13,
		-- C.color14,
		-- C.color15,
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
		require("neopywal.lib.compiler").compile()
		f = assert(loadfile(compiled_path), "could not load neopywal cache.")
	end
	f()
	lock = false
end

function M.setup(user_conf)
	did_setup = true

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
	local git_path = debug.getinfo(1).source:sub(2, -22) .. ".git"
	local git = vim.fn.getftime(git_path) -- 2x faster vim.loop.fs_stat
	local hash = require("neopywal.lib.hashing").hash(user_conf)
		.. (git == -1 and git_path or git) -- no .git in /nix/store -> cache path
		.. (vim.o.winblend == 0 and 1 or 0) -- :h winblend
		.. (vim.o.pumblend == 0 and 1 or 0) -- :h pumblend
		.. sum_colors()

	-- Recompile if hash changed.
	if cached ~= hash then
		require("neopywal.lib.compiler").compile()
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
	require("neopywal.lib.compiler").compile()
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

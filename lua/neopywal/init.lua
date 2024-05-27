local M = {}

local default_options = {
	dim_inactive = true,
	transparent = true,
	use_wallust = false,
	default_fileformats = true,
	default_plugins = true,
	custom_colors = {},
	custom_highlights = {},
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
		bufferline = true,
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

function M.mix(color, option, factor)
	-- Extract the RGB values from the color
	local r, g, b = color:match("#(%x%x)(%x%x)(%x%x)")

	-- Convert the RGB values from hexadecimal to decimal
	r, g, b = tonumber(r, 16), tonumber(g, 16), tonumber(b, 16)

	-- Apply the brightness factor to each RGB value
	if option == "white" then
		r = math.min(r + factor, 255)
		g = math.min(g + factor, 255)
		b = math.min(b + factor, 255)
	elseif option == "black" then
		r = math.min(r - factor, 255)
		g = math.min(g - factor, 255)
		b = math.min(b - factor, 255)
	else
		error("Could not parse color mixing options.")
	end

	-- Convert the RGB values back to hexadecimal and return the new color
	return string.format("#%02x%02x%02x", r, g, b)
end

function M.get_colors()
	if M.options.use_wallust then
		vim.cmd([[ source $HOME/.cache/wallust/colors_neopywal.vim ]])
	else
		vim.cmd([[ source $HOME/.cache/wal/colors-wal.vim ]])
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

	require("neopywal.theme.terminal").get(colors)
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
	user_conf = user_conf or {}
	if user_conf.default_fileformats == false then
		default_options.fileformats = {}
	end
	if user_conf.default_plugins == false then
		default_options.plugins = {}
	end
	M.options = vim.tbl_deep_extend("keep", {}, user_conf, default_options)
end

return M

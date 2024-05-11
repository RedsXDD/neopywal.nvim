local M = {}

local default_options = {
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

function M.get_colors()
	local user_colors = M.options.custom_colors
	vim.cmd([[ source $HOME/.cache/wal/colors-wal.vim ]])

	return {
		none = "NONE",
		transparent = "NONE",
		background = user_colors.background or vim.g.background,
		foreground = user_colors.foreground or vim.g.foreground,
		cursor = user_colors.cursor or vim.g.cursor,
		color0 = user_colors.color0 or vim.g.color0,
		color1 = user_colors.color1 or vim.g.color1,
		color2 = user_colors.color2 or vim.g.color2,
		color3 = user_colors.color3 or vim.g.color3,
		color4 = user_colors.color4 or vim.g.color4,
		color5 = user_colors.color5 or vim.g.color5,
		color6 = user_colors.color6 or vim.g.color6,
		color7 = user_colors.color7 or vim.g.color7,
		color8 = user_colors.color8 or vim.g.color8,
		color9 = user_colors.color9 or vim.g.color9,
		color10 = user_colors.color10 or vim.g.color10,
		color11 = user_colors.color11 or vim.g.color11,
		color12 = user_colors.color12 or vim.g.color12,
		color13 = user_colors.color13 or vim.g.color13,
		color14 = user_colors.color14 or vim.g.color14,
		color15 = user_colors.color15 or vim.g.color15,
	}
end

local did_setup = false
function M.load()
	if not did_setup then M.setup() end

	local colors = M.get_colors()
	vim.opt.termguicolors = true

	local user_highlights = M.options.custom_highlights
	if type(user_highlights) == "function" then user_highlights = user_highlights(colors) end

	local theme = vim.tbl_deep_extend("keep", {},
		user_highlights,
		require("neopywal.theme.ui").get(colors),
		require("neopywal.theme.syntax").get(colors),
		require("neopywal.theme.fileformats").get(colors),
		require("neopywal.theme.plugins").get(colors),
	{})

	for highlight_group, properties in pairs(theme) do
		vim.api.nvim_set_hl(0, highlight_group, properties)
	end
end

function M.setup(user_conf)
	did_setup = true
	user_conf = user_conf or {}
	if user_conf.default_fileformats == false then default_options.fileformats = {} end
	if user_conf.default_plugins == false then default_options.plugins = {} end
	M.options = vim.tbl_deep_extend("keep", {}, user_conf, default_options)
end

return M

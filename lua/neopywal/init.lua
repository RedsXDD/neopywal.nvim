local M = {
	default_options = {
		default_fileformats = true,
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
		default_plugins = true,
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
	},
}

M.options = M.default_options

function M.get_colors()
	vim.cmd([[ source $HOME/.cache/wal/colors-wal.vim ]])

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
	local theme = vim.tbl_deep_extend("force",
		require("neopywal.theme.ui").get(colors),
		require("neopywal.theme.syntax").get(colors),
		require("neopywal.theme.fileformats").get(colors),
		require("neopywal.theme.plugins").get(colors),
		{})

	for highlight_group, properties in pairs(theme) do
		vim.api.nvim_set_hl(0, highlight_group, properties)
	end
end

local did_setup = false
function M.load()
	if not did_setup then M.setup() end
	local colors = M.get_colors()
	vim.opt.termguicolors = true
	apply_highlights(colors)
end

function M.setup(user_conf)
	did_setup = true

	-- User configuration setup:
	user_conf = user_conf or {}
	if user_conf.default_fileformats == false then M.default_options.fileformats = {} end
	if user_conf.default_plugins == false then M.default_options.plugins = {} end
	M.options = vim.tbl_deep_extend("keep", {}, user_conf, M.default_options)
end

return M

-- vim:fileencoding=utf-8:foldmethod=marker

-- Tip: You can discover the highlight groups names that are currently in use by running ":filer /FILTER_STRING/ hi"
-- E.g. To find all the highlight groups for the neovim plugin "bufferline.nvim" you can do ":filter /BufferLine/ hi"

local M = {}

M.highlights_base = function (colors)
	local theme = {}
	local integrations = {}

	local filetypes = {
		"markdown",
		"reStructuredText",
		"latex",
		"html",
		"xml",
		"css",
		"sass",
		"less",
		"js",
		"js_react",
		"typescript",
		"dart",
		"c_cpp",
		"objectiveC",
		"c_sharp",
		"python",
		"lua",
		"java",
		"kotlin",
		"scala",
		"go",
		"rust",
		"swift",
		"php",
		"ruby",
		"haskell",
		"perl",
		"ocaml",
		"erlang",
		"elixir",
		"common_lisp",
		"clojure",
		"matlab",
		"sh",
		"zsh",
		"powershell",
		"vimL",
		"makefile",
		"cmake",
		"json",
		"yaml",
		"toml",
		"diff",
		"git_commit",
		"help",
	}

	local plugins = {
		"coc",
		"ale",
		"vim_gitgutter",
		"nvim_cmp",
		"nvim_lspconfig",
		"lazy",
		"nvim_treesitter",
		"neotree",
		"bufferline",
		"which_key",
		"dashboard",
		"alpha",
		"indent_blankline",
		"netrw",
		"undotree",
		"telescope",
		"mini.indentscope",
		"mini.statusline",
		"mini.tabline",
		"mini.starter",
		"mini.cursorword",
		"mini.files",
		"mini.hipatterns",
		"mini.pick",
	}

	for _, filetype in ipairs(filetypes) do
		integrations = vim.tbl_deep_extend("force", integrations, require("neopywal.groups.filetypes." .. filetype).get(colors))
	end

	for _, plugin in ipairs(plugins) do
		integrations = vim.tbl_deep_extend("force", integrations, require("neopywal.groups.plugins." .. plugin).get(colors))
	end

	theme = vim.tbl_deep_extend("force",
		theme,
		integrations,
		require("neopywal.groups.ui").get(colors),
		require("neopywal.groups.syntax").get(colors)
	)

	return theme
end

return M

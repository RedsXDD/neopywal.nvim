local M = {}

local get_highlights = function(colors)
	local fileformats = {
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

	local extra_highlights = {}

	for _, fileformat in ipairs(fileformats) do
		extra_highlights = vim.tbl_deep_extend("force", extra_highlights, require("neopywal.groups.fileformats." .. fileformat).get(colors))
	end

	for _, plugin in ipairs(plugins) do
		extra_highlights = vim.tbl_deep_extend("force", extra_highlights, require("neopywal.groups.plugins." .. plugin).get(colors))
	end

	local highlights = vim.tbl_deep_extend("force",
		require("neopywal.groups.ui").get(colors),
		require("neopywal.groups.syntax").get(colors),
		extra_highlights
	)

	return highlights
end

function M.apply_highlights(colors)
	local base_highlights = get_highlights(colors)
	for group, properties in pairs(base_highlights) do
		vim.api.nvim_set_hl(0, group, properties)
	end
end

return M

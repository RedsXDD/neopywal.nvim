local M = {}

---@param theme_style? string
function M.get(theme_style)
	local theme = {}

	local _O, _C, _U = O, C, U -- Borrowing global variables (setfenv doesn't work with require)
	O = require("neopywal").options
	C = require("neopywal").get_colors(theme_style)
	U = require("neopywal.utils.color")

	theme.editor = require("neopywal.theme.editor").get()

	-- Get user-defined highlights.
	local user_highlights = O.custom_highlights
	if type(user_highlights) == "function" then
		user_highlights = user_highlights(C)
	end
	theme.custom_highlights = user_highlights

	-- Get highlights for enabled fileformats.
	local fileformats = {}
	for fileformat in pairs(O.fileformats) do
		if O.fileformats[fileformat] == true then
			fileformats = vim.tbl_deep_extend("force", fileformats, require("neopywal.theme.fileformats")[fileformat]())
		end
	end
	theme.fileformats = fileformats

	-- Get highlights for enabled plugins.
	local plugins = {}
	local function load_plugin(plugin, option)
		if type(option) == "table" and option.enabled then
			plugins = vim.tbl_deep_extend("force", plugins, require("neopywal.theme.plugins." .. plugin).get())
		elseif option == true then
			plugins = vim.tbl_deep_extend("force", plugins, require("neopywal.theme.plugins." .. plugin).get())
		end
	end

	for plugin, option in pairs(O.plugins) do
		if plugin == "mini" then
			for mini_plugin, mini_option in pairs(option) do
				load_plugin("mini." .. mini_plugin, mini_option)
			end
		else
			load_plugin(plugin, option)
		end
	end
	theme.plugins = plugins

	O, C, U = _O, _C, _U -- Returning global variables

	return theme
end

return M

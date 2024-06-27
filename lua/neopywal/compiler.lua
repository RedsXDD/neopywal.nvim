-- Credits:
-- https://github.com/catppuccin/nvim -- Where i took the original compiler code.
-- https://github.com/EdenEast/nightfox.nvim -- The plugin catppuccin credits.

local M = {}
local O = require("neopywal").options

local function inspect(t)
	local list = {}

	for k, v in pairs(t) do
		local tv = type(v)
		if tv == "string" then
			table.insert(list, string.format([[%s = "%s"]], k, v))
		elseif tv == "table" then
			table.insert(list, string.format([[%s = %s]], k, inspect(v)))
		else
			table.insert(list, string.format([[%s = %s]], k, tostring(v)))
		end
	end

	return string.format([[{ %s }]], table.concat(list, ", "))
end

local function map_highlights()
	local theme = {}
	local colors = require("neopywal").get_colors()

	-- Get user-defined highlights.
	local user_highlights = O.custom_highlights
	if type(user_highlights) == "function" then
		user_highlights = user_highlights(colors)
	end

	theme.custom_highlights = user_highlights
	theme.terminal = require("neopywal.theme.terminal").get(colors)
	theme.editor = require("neopywal.theme.editor").get(colors)
	theme.fileformats = require("neopywal.theme.fileformats").get(colors)
	theme.plugins = require("neopywal.theme.plugins").get(colors)
	theme.mini = O.plugins.mini and require("neopywal.theme.mini").get(colors) or {}
	theme.treesitter = O.plugins.treesitter and require("neopywal.theme.treesitter").get(colors) or {}

	return theme
end

function M.compile()
	local filename = require("neopywal").compiled_filename
	local theme = map_highlights()

	local path_sep = require("neopywal").path_sep
	local compile_path = require("neopywal").compile_path

	if path_sep == "\\" then
		compile_path = compile_path:gsub("/", "\\")
	end

	local tbl = vim.tbl_deep_extend(
		"keep",
		theme.custom_highlights,
		theme.editor,
		theme.fileformats,
		theme.plugins,
		theme.treesitter,
		theme.mini,
		{}
	)

	local lines = {
		string.format(
			[[
return string.dump(function()
vim.o.termguicolors = true
if vim.g.colors_name then vim.cmd("hi clear") end
vim.g.colors_name = "neopywal-%s"
local h = vim.api.nvim_set_hl]],
			filename
		),
	}

	if O.terminal_colors == true then
		for k, v in pairs(theme.terminal) do
			table.insert(lines, string.format('vim.g.%s = "%s"', k, v))
		end
	end

	for group, properties in pairs(tbl) do
		if properties.styles then
			for _, style in pairs(properties.styles) do
				properties[style] = true

				if O.no_italic and style == "italic" then
					properties[style] = false
				end

				if O.no_bold and style == "bold" then
					properties[style] = false
				end

				if O.no_underline and style == "underline" then
					properties[style] = false
				end

				if O.no_undercurl and style == "undercurl" then
					properties[style] = false
				end

				if O.no_strikethrough and style == "strikethrough" then
					properties[style] = false
				end
			end
		end

		properties.styles = nil

		if properties.link and (theme.custom_highlights[group] and not theme.custom_highlights[group].link) then
			properties.link = nil
		end

		table.insert(lines, string.format([[h(0, "%s", %s)]], group, inspect(properties)))
	end

	table.insert(lines, "end, true)")

	if vim.fn.isdirectory(compile_path) == 0 then
		vim.fn.mkdir(compile_path, "p")
	end

	if vim.g.neopywal_debug then -- Debugging purpose
		local deb = io.open(compile_path .. path_sep .. filename .. ".lua", "wb")
		if deb then
			deb:write(table.concat(lines, "\n"))
			deb:close()
		end
	end

	local f = loadstring(table.concat(lines, "\n"))
	if not f then
		local err_path = (path_sep == "/" and "/tmp" or os.getenv("TMP")) .. "/neopywal_error.lua"
		print(string.format(
			[[Neopywal (error): Most likely some mistake made in your neopywal config
You can open %s for debugging

If you think this is a bug, kindly open an issue and attach %s file
Below is the error message that we captured:
]],
			err_path,
			err_path
		))

		local err = io.open(err_path, "wb")
		if err then
			err:write(table.concat(lines, "\n"))
			err:close()
		end

		dofile(err_path)
		return
	end

	local file = assert(
		io.open(compile_path .. path_sep .. filename, "wb"),
		"Permission denied while writing compiled file to " .. compile_path .. path_sep .. filename
	)

	file:write(f())
	file:close()
end

return M

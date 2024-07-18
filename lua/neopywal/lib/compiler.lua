-- Credits:
-- https://github.com/catppuccin/nvim -- Where i took the original compiler code.
-- https://github.com/EdenEast/nightfox.nvim -- The plugin catppuccin credits.

local M = {}
local notify = require("neopywal.lib.notify")

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

---@param theme_style? string
local function compile(theme_style)
	if not theme_style or theme_style ~= "dark" and theme_style ~= "light" then
		theme_style = vim.o.background
	end

	local O = require("neopywal").options
	local G = require("neopywal").compiler
	local compile_path = G.compile_path
	local path_sep = G.path_sep
	local filename = G.filename .. "-" .. theme_style

	local theme = require("neopywal.lib.mapper").get(theme_style)
	local highlights =
		vim.tbl_deep_extend("keep", theme.custom_highlights, theme.editor, theme.fileformats, theme.plugins)

	if path_sep == "\\" then
		compile_path = compile_path:gsub("/", "\\")
	end

	local lines = {
		string.format(
			[[
return string.dump(function()
vim.o.termguicolors = true
if vim.g.colors_name then vim.cmd("hi clear") end
vim.g.colors_name = "neopywal-%s"
local h = vim.api.nvim_set_hl]],
			theme_style
		),
	}

	if O.terminal_colors == true then
		for group, color in pairs(theme.terminal) do
			table.insert(lines, string.format('vim.g.%s = "%s"', group, color))
		end
	end

	for group, properties in pairs(highlights) do
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
		local err_path = (path_sep == "/" and "/tmp" or os.getenv("TMP")) .. path_sep .. "neopywal_error.lua"
		notify.error(string.format(
			[[
Most likely some mistake made in your Neopywal config
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

function M.compile()
	notify.clear()
	compile("dark")
	compile("light")
end

return M

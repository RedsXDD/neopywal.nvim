local M = {}

M.get = function(colors)
	return {
		-- Toml:
		tomlTable      = { bg = colors.background, fg = colors.color5, bold = true },
		tomlKey        = { fg = colors.color1 },
		tomlBoolean    = { fg = colors.color4 },
		tomlString     = { fg = colors.color2 },
		tomlTableArray = { link = "tomlTable" },
	}
end

return M

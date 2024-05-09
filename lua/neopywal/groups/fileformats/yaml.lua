local M = {}

M.get = function(colors)
	return {
		-- Yaml:
		yamlKey      = { fg = colors.color1 },
		yamlConstant = { fg = colors.color4, italic = true },
		yamlString   = { fg = colors.color2 },
	}
end

return M

local M = {}

function M.get()
	-- echasnovski/mini.completion
	return {
		MiniCompletionActiveParameter = { styles = O.plugins.mini.completion.parameter_style or {} },
	}
end

return M

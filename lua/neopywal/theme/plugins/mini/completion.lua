local M = {}

function M.get()
	return {
		MiniCompletionActiveParameter = { styles = O.plugins.mini.completion.parameter_style or {} },
	}
end

return M

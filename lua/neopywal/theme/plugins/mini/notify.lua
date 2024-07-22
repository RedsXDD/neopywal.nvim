local M = {}

function M.get()
	-- echasnovski/mini.notify
	return {
		MiniNotifyBorder = { link = "FloatBorder" },
		MiniNotifyNormal = { link = "NormalFloat" },
		MiniNotifyTitle = { link = "FloatTitle" },
	}
end

return M

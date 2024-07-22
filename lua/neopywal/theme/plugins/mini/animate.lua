local M = {}

function M.get()
	-- echasnovski/mini.animate
	return {
		MiniAnimateCursor = { styles = { "reverse", "nocombine" } },
		MiniAnimateNormalFloat = { link = "NormalFloat" },
	}
end

return M

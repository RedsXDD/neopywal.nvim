local M = {}

function M.get()
	-- echasnovski/mini.jump
	return {
		MiniJump = { fg = C.color2, styles = O.plugins.mini.jump.style or {} },
	}
end

return M

local M = {}

function M.get()
    local bg = O.transparent_background and C.none or C.dim_bg
    return {
        MiniJump = { bg = bg, fg = C.color2, styles = O.plugins.mini.jump.style or {} },
    }
end

return M

local M = {}

function M.get()
    local bg = O.transparent_background and C.none or U.blend(C.foreground, C.background, 0.2)
    return {
        MiniJump2dDim = { fg = C.comment },
        MiniJump2dSpot = { bg = bg, fg = C.color5, styles = O.plugins.mini.jump2d.style or {} },
        MiniJump2dSpotAhead = { bg = bg, fg = C.color2, styles = O.plugins.mini.jump2d.style or {} },
        MiniJump2dSpotUnique = { bg = bg, fg = C.color4, styles = O.plugins.mini.jump2d.style or {} },
    }
end

return M

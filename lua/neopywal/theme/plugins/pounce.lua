local M = {}

function M.get()
    local bg = O.transparent_background and C.none or C.dim_bg
    return {
        PounceMatch = { bg = bg, fg = C.color5, styles = O.plugins.pounce.style or {} },
        PounceGap = { bg = bg, fg = C.color3, styles = O.plugins.pounce.style or {} },
        PounceAccept = { bg = bg, fg = C.color2, styles = O.plugins.pounce.style or {} },
        PounceAcceptBest = { bg = bg, fg = C.color6, styles = O.plugins.pounce.style or {} },
    }
end

return M

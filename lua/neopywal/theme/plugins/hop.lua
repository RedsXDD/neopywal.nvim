local M = {}

function M.get()
    local bg = O.transparent_background and C.none or U.blend(C.foreground, C.background, 0.2)
    return {
        HopNextKey = { bg = bg, fg = C.color5, styles = O.plugins.hop.style or {} },
        HopNextKey1 = { bg = bg, fg = C.color4, styles = O.plugins.hop.style or {} },
        HopNextKey2 = { bg = bg, fg = C.color2, styles = O.plugins.hop.style or {} },
        HopUnmatched = { bg = bg, fg = C.comment },
    }
end

return M

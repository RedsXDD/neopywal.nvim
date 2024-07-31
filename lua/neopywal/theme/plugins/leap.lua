local M = {}

function M.get()
    local bg = O.transparent_background and C.none or C.dim_bg
    return {
        LeapBackdrop = { fg = C.comment },
        LeapMatch = {
            bg = bg,
            fg = C.color5,
            styles = O.plugins.leap.style or {},
        },
        LeapLabel = {
            bg = bg,
            fg = C.color2,
            styles = O.plugins.leap.style or {},
        },
    }
end

return M

local M = {}

function M.get()
    return {
        MiniTablineCurrent = { link = "TabLineSel" },
        MiniTablineFill = { link = "TabLineFill" },
        MiniTablineVisible = { link = "TabLine" },
        MiniTablineHidden = { link = "MiniTablineVisible" },
        MiniTablineModifiedCurrent = {
            bg = O.transparent_background and U.lighten(C.background, 20) or C.background,
            fg = U.blend(C.color1, C.color3, 0.5),
            styles = { "bold", "italic" },
        },
        MiniTablineModifiedVisible = { link = "MiniTablineVisible" },
        MiniTablineModifiedHidden = { link = "MiniTablineModifiedVisible" },
        MiniTablineTabpagesection = { link = "MiniTablineCurrent" },
    }
end

return M

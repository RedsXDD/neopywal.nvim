local M = {}

function M.get()
    return {
        DashboardShortCut = { fg = U.blend(C.color1, C.color3, 0.5) },
        DashboardHeader = { fg = C.color4, styles = { "bold" } },
        DashboardCenter = { fg = C.color6, styles = { "bold" } },
        DashboardFooter = { fg = C.color5, styles = { "bold" } },
        DashboardKey = { fg = C.color1, styles = { "bold" } },
        DashboardDesc = { fg = C.foreground },
        DashboardIcon = { link = "DashboardDesc" },
    }
end

return M

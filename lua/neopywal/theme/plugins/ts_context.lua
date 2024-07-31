local M = {}

function M.get()
    local bg = O.transparent_background and C.none or O.plugins.ts_context.dim_background and C.dim_bg or C.background
    local fg = O.transparent_background and C.foreground or C.comment

    return {
        TreesitterContext = { bg = bg },
        TreesitterContextLineNumber = { bg = bg, fg = fg },
        TreesitterContextBottom = { bg = bg, sp = fg, styles = O.plugins.ts_context.style or {} },
        TreesitterContextLineNumberBottom = { link = "TreesitterContextBottom" },
        TreesitterContextSeparator = { bg = bg, fg = fg },
    }
end

return M

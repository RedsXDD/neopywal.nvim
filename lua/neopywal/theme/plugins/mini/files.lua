local M = {}

function M.get()
    return {
        MiniFilesBorder = { link = "FloatBorder" },
        MiniFilesBorderModified = {
            bg = (O.transparent_background and vim.o.winblend == 0) and C.none or C.background,
            fg = C.warn,
        },
        MiniFilesCursorLine = { link = "CursorLine" },
        MiniFilesDirectory = { link = "Directory" },
        MiniFilesFile = {},
        MiniFilesNormal = { link = "NormalFloat" },
        MiniFilesTitle = {
            bg = (O.transparent_background and vim.o.winblend == 0) and C.none or C.background,
            fg = C.comment,
        },
        MiniFilesTitleFocused = { link = "FloatTitle" },
    }
end

return M

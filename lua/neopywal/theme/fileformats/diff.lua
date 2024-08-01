local M = {}

function M.get()
    return {
        diffAdded = { link = "DiffAdd" },
        diffRemoved = { link = "DiffDelete" },
        diffChanged = { link = "DiffChange" },
        diffOldFile = { link = "Debug" },
        diffNewFile = { link = "Identifier" },
        diffFile = { link = "Directory" },
        diffLine = { link = "Comment" },
        diffIndexLine = { link = "Special" },
    }
end

return M

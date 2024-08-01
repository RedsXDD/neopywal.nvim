local M = {}

function M.get()
    return {
        -- builtin: https://github.com/nickspoons/vim-cs:
        csUnspecifiedStatement = { link = "Statement" },
        csStorage = { link = "StorageClass" },
        csClass = { link = "Type" },
        csNewType = { link = "Type" },
        csContextualStatement = { link = "Statement" },
        csInterpolationDelimiter = { link = "Special" },
        csInterpolation = { link = "Special" },
        csEndColon = { link = "Delimiter" },
    }
end

return M

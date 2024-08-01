local M = {}

function M.get()
    return {
        -- dart-lang: https://github.com/dart-lang/dart-vim-plugin:
        dartCoreClasses = { link = "Type" },
        dartTypeName = { link = "Type" },
        dartInterpolation = { link = "Special" },
        dartTypeDef = { link = "Typedef" },
        dartClassDecl = { link = "Define" },
        dartLibrary = { link = "PreProc" },
        dartMetadata = { link = "Identifier" },
    }
end

return M

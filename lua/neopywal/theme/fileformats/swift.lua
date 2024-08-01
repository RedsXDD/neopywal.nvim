local M = {}

function M.get()
    return {
        -- swift.vim: https://github.com/keith/swift.vim:
        swiftInterpolatedWrapper = { link = "Special" },
        swiftInterpolatedString = { link = "String" },
        swiftProperty = { link = "PreProc" },
        swiftTypeDeclaration = { link = "Type" },
        swiftClosureArgument = { link = "Identifier" },
        swiftStructure = { link = "Structure" },
    }
end

return M

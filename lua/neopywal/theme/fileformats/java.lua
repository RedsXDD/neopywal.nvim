local M = {}

function M.get()
    return {
        -- builtin:
        javaClassDecl = { link = "Define" },
        javaMethodDecl = { link = "Define" },
        javaVarArg = { link = "Identifier" },
        javaAnnotation = { link = "String" },
        javaUserLabel = { link = "Label" },
        javaTypedef = { link = "Typedef" },
        javaParen = { link = "SpecialChar" },
        javaParen1 = { link = "SpecialChar" },
        javaParen2 = { link = "SpecialChar" },
        javaParen3 = { link = "SpecialChar" },
        javaParen4 = { link = "SpecialChar" },
        javaParen5 = { link = "SpecialChar" },
    }
end

return M

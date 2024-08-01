local M = {}

function M.get()
    return {
        -- vim-cpp-enhanced-highlight: https://github.com/octol/vim-cpp-enhanced-highlight:
        cLabel = { link = "Label" },
        cppSTLnamespace = { link = "Include" },
        cppSTLtype = { link = "Type" },
        cppAccess = { link = "Function" },
        cppStructure = { link = "Structure" },
        cppSTLios = { link = "Type" },
        cppSTLiterator = { link = "Type" },
        cppSTLexception = { link = "Exception" },

        -- vim-cpp-modern: https://github.com/bfrg/vim-cpp-modern:
        cppSTLVariable = { link = "Variable" },

        -- chromatica: https://github.com/arakashic/chromatica.nvim:
        Member = { link = "Type" },
        Namespace = { link = "Include" },
        EnumConstant = { link = "Constant" },
        chromaticaException = { link = "Exception" },
        chromaticaCast = { link = "Function" },
        OperatorOverload = { link = "Error" },
        AccessQual = { link = "Function" },
        Linkage = { link = "Operator" },
        AutoType = { link = "Type" },

        -- vim-lsp-cxx-highlight https://github.com/jackguo380/vim-lsp-cxx-highlight:
        LspCxxHlSkippedRegion = { link = "Special" },
        LspCxxHlSkippedRegionBeginEnd = { link = "Delimiter" },
        LspCxxHlGroupEnumConstant = { link = "Constant" },
        LspCxxHlGroupNamespace = { link = "Include" },
        LspCxxHlGroupMemberVariable = { link = "Variable" },
    }
end

return M

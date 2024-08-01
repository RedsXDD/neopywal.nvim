local M = {}

function M.get()
    return {
        -- vim-elixir: https://github.com/elixir-editors/vim-elixir:
        elixirStringDelimiter = { link = "Delimiter" },
        elixirKeyword = { link = "Keyword" },
        elixirInterpolation = { link = "Special" },
        elixirInterpolationDelimiter = { link = "Special" },
        elixirSelf = { link = "Statement" },
        elixirPseudoVariable = { link = "Identifier" },
        elixirModuleDefine = { link = "Define" },
        elixirBlockDefinition = { link = "Define" },
        elixirDefine = { link = "Define" },
        elixirPrivateDefine = { link = "Define" },
        elixirGuard = { link = "Define" },
        elixirPrivateGuard = { link = "Define" },
        elixirProtocolDefine = { link = "Define" },
        elixirImplDefine = { link = "Define" },
        elixirRecordDefine = { link = "Define" },
        elixirPrivateRecordDefine = { link = "Define" },
        elixirMacroDefine = { link = "Define" },
        elixirPrivateMacroDefine = { link = "Define" },
        elixirDelegateDefine = { link = "Define" },
        elixirOverridableDefine = { link = "Define" },
        elixirExceptionDefine = { link = "Define" },
        elixirCallbackDefine = { link = "Define" },
        elixirStructDefine = { link = "Define" },
        elixirExUnitMacro = { link = "Macro" },
    }
end

return M

local M = {}

function M.get()
    return {
        -- builtin: https://github.com/rust-lang/rust.vim:
        rustStructure = { link = "Structure" },
        rustIdentifier = { link = "Identifier" },
        rustModPath = { link = "Directory" },
        rustModPathSep = { link = "Delimiter" },
        rustSelf = { link = "Identifier" },
        rustSuper = { link = "Identifier" },
        rustDeriveTrait = { link = "SpecialChar" },
        rustEnumVariant = { link = "Constant" },
        rustMacroVariable = { link = "Macro" },
        rustAssert = { link = "Function" },
        rustPanic = { link = "Error" },
        rustPubScopeCrate = { link = "PreProc" },
        rustAttribute = { link = "Type" },
    }
end

return M

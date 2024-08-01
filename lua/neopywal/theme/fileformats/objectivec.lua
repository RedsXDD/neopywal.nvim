local M = {}

function M.get()
    return {
        -- builtin:
        objcModuleImport = { link = "Include" },
        objcException = { link = "Exception" },
        objcProtocolList = { link = "Statement" },
        objcDirective = { link = "PreProc" },
        objcPropertyAttribute = { link = "Type" },
        objcHiddenArgument = { link = "Identifier" },
    }
end

return M

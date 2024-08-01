local M = {}

function M.get()
    return {
        -- builtin: https://jasonwoof.com/gitweb/?p=vim-syntax.git;a=blob;f=php.vim;hb=HEAD:
        phpVarSelector = { link = "Define" },
        phpIdentifier = { link = "Identifier" },
        phpDefine = { link = "Define" },
        phpStructure = { link = "Structure" },
        phpSpecialFunction = { link = "Function" },
        phpInterpSimpleCurly = { link = "Special" },
        phpComparison = { link = "Conditional" },
        phpMethodsVar = { link = "Variable" },
        phpInterpVarname = { link = "Special" },
        phpMemberSelector = { link = "Identifier" },
        phpLabel = { link = "Label" },

        -- php.vim: https://github.com/StanAngeloff/php.vim:
        phpParent = { link = "Directory" },
        phpNowDoc = { link = "String" },
        phpFunction = { link = "Function" },
        phpMethod = { link = "Function" },
        phpClass = { link = "Type" },
        phpSuperglobals = { link = "Type" },
        phpNullValue = { link = "Constant" },
    }
end

return M

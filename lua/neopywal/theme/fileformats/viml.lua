local M = {}

function M.get()
    return {
        vimLet = { link = "Define" },
        vimFunction = { link = "Function" },
        vimIsCommand = { link = "Conditional" },
        vimUserFunc = { link = "Function" },
        vimFuncName = { link = "Function" },
        vimMap = { link = "Define" },
        vimNotation = { link = "Identifier" },
        vimMapLhs = { link = "Identifier" },
        vimMapRhs = { link = "Identifier" },
        vimSetEqual = { link = "Identifier" },
        vimSetSep = { link = "SpecialChar" },
        vimOption = { link = "Variable" },
        vimUserAttrbKey = { link = "Type" },
        vimUserAttrb = { link = "Identifier" },
        vimAutoCmdSfxList = { link = "Special" },
        vimSynType = { link = "Type" },
        vimHiBang = { link = "Identifier" },
        vimSet = { link = "Statement" },
    }
end

return M

local M = {}

function M.get()
    return {
        -- builtin: https://github.com/JulesWang/css.vim:
        cssStringQ = { link = "String" },
        cssStringQQ = { link = "cssStringQ" },
        cssAttrComma = { link = "Normal" },
        cssBraces = { link = "SpecialChar" },
        cssTagName = { link = "Tag" },
        cssClassNameDot = { link = "Delimiter" },
        cssClassName = { link = "Constant" },
        cssFunctionName = { link = "Function" },
        cssAttr = { link = "Type" },
        cssCommonAttr = { link = "Type" },
        cssProp = { link = "Statement" },
        cssPseudoClassId = { link = "Identifier" },
        cssPseudoClassFn = { link = "Function" },
        cssPseudoClass = { link = "String" },
        cssImportant = { link = "Statement" },
        cssSelectorOp = { link = "Identifier" },
        cssSelectorOp2 = { link = "Identifier" },
        cssColor = { link = "Special" },
        cssUnitDecorators = { link = "Identifier" },
        cssValueLength = { link = "Number" },
        cssValueInteger = { link = "Constant" },
        cssValueNumber = { link = "Number" },
        cssValueAngle = { link = "Float" },
        cssValueTime = { link = "Float" },
        cssValueFrequency = { link = "Float" },
        cssVendor = { link = "Normal" },
        cssNoise = { link = "Normal" },
    }
end

return M

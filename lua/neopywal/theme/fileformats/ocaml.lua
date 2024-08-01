local M = {}

function M.get()
    return {
        -- builtin: https://github.com/rgrinberg/vim-ocaml:
        ocamlArrow = { link = "Function" },
        ocamlEqual = { link = "Statement" },
        ocamlOperator = { link = "Operator" },
        ocamlKeyChar = { link = "Keyword" },
        ocamlModPath = { link = "Directory" },
        ocamlFullMod = { link = "Include" },
        ocamlModule = { link = "String" },
        ocamlConstructor = { link = "Special" },
        ocamlModParam = { link = "Identifier" },
        ocamlModParam1 = { link = "Identifier" },
        ocamlAnyVar = { link = "Variable" },
        ocamlPpxEncl = { link = "Function" },
        ocamlPpxIdentifier = { link = "Identifier" },
        ocamlSigEncl = { link = "Function" },
    }
end

return M

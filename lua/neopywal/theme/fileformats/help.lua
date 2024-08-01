local M = {}

function M.get()
    return {
        helpNote = { link = "String" },
        helpHeadline = { link = "Statement" },
        helpHeader = { link = "Statement" },
        helpURL = { link = "URLlink" },
        helpHyperTextEntry = { link = "URLlink" },
        helpHyperTextJump = { link = "Directory" },
        helpCommand = { link = "Function" },
        helpExample = { link = "Identifier" },
        helpSpecial = { link = "Special" },
        helpSectionDelim = { link = "Delimiter" },
    }
end

return M

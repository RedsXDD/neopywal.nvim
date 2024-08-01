local M = {}

function M.get()
    return {
        -- builtin: https://github.com/chrisbra/vim-xml-ftplugin:
        xmlTag = { link = "Delimiter" },
        xmlEndTag = { link = "Delimiter" },
        xmlTagName = { link = "Label" },
        xmlEqual = { link = "Statement" },
        xmlAttrib = { link = "Type" },
        xmlEntity = { link = "Identifier" },
        xmlEntityPunct = { link = "Identifier" },
        xmlDocTypeDecl = { link = "Type" },
        xmlDocTypeKeyword = { link = "Keyword" },
        xmlCdataStart = { link = "Normal" },
        xmlCdataCdata = { link = "PreProc" },
        xmlString = { link = "String" },
    }
end

return M

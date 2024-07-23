local M = {}

-- LSP symbol kind and completion kind highlights.
local has_treesitter = require("neopywal").options.plugins.treesitter
-- stylua: ignore
local kinds = has_treesitter and {
        Array = "@punctuation.bracket",
        Boolean = "@boolean",
        Class = "@type",
        Color = "Constant",
        Constant = "@constant",
        Constructor = "@constructor",
        Enum = "@lsp.type.enum",
        EnumMember = "@lsp.type.enumMember",
        Event = "@type",
        Field = "@field",
        File = "@text.uri",
        Folder = "Directory",
        Function = "@function",
        Interface = "@lsp.type.interface",
        Key = "@variable.member",
        Keyword = "@keyword",
        Method = "@method",
        Module = "@module",
        Namespace = "@namespace",
        Null = "@constant.builtin",
        Number = "@number",
        Object = "@constant",
        Operator = "@operator",
        Package = "@module",
        Property = "@property",
        Reference = "@markup.link",
        Snippet = "@module",
        String = "@string",
        Struct = "@lsp.type.struct",
        Text = "@markup",
        TypeParameter = "@lsp.type.typeParameter",
        Unit = "@lsp.type.struct",
        Value = "@string",
        Variable = "@variable",
} or {
        Array = "Special",
        Boolean = "Boolean",
        Class = "Type",
        Color = "Constant",
        Constant = "Constant",
        Constructor = "Special",
        Enum = "Type",
        EnumMember = "Constant",
        Event = "Type",
        Field = "Function",
        File = "URLlink",
        Folder = "Directory",
        Function = "Function",
        Interface = "Variable",
        Key = "Function",
        Keyword = "Keyword",
        Method = "Function",
        Module = "Include",
        Namespace = "Include",
        Null = "Special",
        Number = "Number",
        Object = "Constant",
        Operator = "Operator",
        Package = "Include",
        Property = "Function",
        Reference = "Tag",
        Snippet = "Include",
        String = "String",
        Struct = "Type",
        Text = "Normal",
        TypeParameter = "TypeDef",
        Unit = "Type",
        Value = "String",
        Variable = "Variable",
}

---@param pattern string?
function M.get(pattern)
    local hl = {}
    for kind, link in pairs(kinds) do
        if pattern then
            hl[pattern:format(kind)] = { link = link }
        else
            hl[kind] = { link = link }
        end
    end
    return hl
end

return M

local M = {}
local C = require("neopywal.lib.palette").get_colors()

-- LSP symbol kind and completion kind highlights.
local kinds = {
    Array = { fg = C.special }, --  Links to "@punctuation.bracket" => "Special".
    Boolean = { fg = C.boolean }, --  Links to "@boolean" => "Boolean".
    Class = { fg = C.type }, --  Links to "@type" => "Type".
    Color = { fg = C.constant }, --  Links to "@constant" => "Constant".
    Constant = { fg = C.constant }, --  Links to "@constant" => "Constant".
    Constructor = { fg = C.special }, --  Links to "@constructor" => "Special".
    Enum = { fg = C.type }, --  Links to "@lsp.type.enum" => "Type".
    EnumMember = { fg = C.constant }, --  Links to "@lsp.type.enumMember" => "Constant".
    Event = { fg = C.type }, --  Links to "@type" => "Type".
    Field = { fg = C.func }, --  Links to "@field" => "Function".
    File = { fg = C.color4 }, --  Links to "@text.uri" => "URLlink".
    Folder = { fg = C.color4 }, -- Links to "Directory".
    Function = { fg = C.func }, --  Links to "@function" => "Function".
    Interface = { fg = C.variable }, --  Links to "@lsp.type.interface" => "Variable".
    Key = { fg = C.func }, --  Links to "@variable.member" => "Function".
    Keyword = { fg = C.keyword }, --  Links to "@keyword" => "Keyword".
    Method = { fg = C.func }, --  Links to "@method" => "Function".
    Module = { fg = C.include }, --  Links to "@module" => "Include".
    Namespace = { fg = C.include }, --  Links to "@namespace" => "Include".
    Null = { fg = C.special }, --  Links to "@constant.builtin" => "Special".
    Number = { fg = C.number }, --  Links to "@number" => "Number".
    Object = { fg = C.constant }, --  Links to "@constant" => "Constant".
    Operator = { fg = C.operator }, --  Links to "@operator" => "Operator".
    Package = { fg = C.include }, --  Links to "@module" => "Include".
    Property = { fg = C.func }, --  Links to "@property" => "Function".
    Reference = { fg = C.tag }, --  Links to "@markup.link" => "Tag".
    Snippet = { fg = C.include }, --  Links to "@module" => "Include".
    String = { fg = C.string }, --  Links to "@string" => "String".
    Struct = { fg = C.type }, --  Links to "@lsp.type.struct" => "Type".
    Text = { fg = C.foreground }, -- Links to "Normal".
    TypeParameter = { fg = C.type }, --  Links to "@lsp.type.typeParameter" => "TypeDef".
    Unit = { fg = C.type }, --  Links to "@lsp.type.struct" => "Type".
    Value = { fg = C.string }, --  Links to "@string" => "String".
    Variable = { fg = C.variable }, --  Links to "@variable" => "Variable".
}

---@param pattern string?
---@param append_to_hls table?
function M.get(pattern, append_to_hls)
    local hl = {}
    pattern = pattern or ""

    for kind, kind_properties in pairs(kinds) do
        local basename = kind
        if pattern ~= "" then basename = pattern:format(kind) end

        if type(append_to_hls) == "table" and next(append_to_hls) ~= nil then
            hl[basename] = vim.tbl_extend("keep", append_to_hls, kind_properties)
        else
            hl[basename] = kind_properties
        end
    end

    return hl
end

return M

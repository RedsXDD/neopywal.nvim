local M = {}

function M.get()
    local color = O.plugins.dropbar.colored_text

    local kinds = require("neopywal.utils.kinds").get()
    kinds = vim.tbl_deep_extend("keep", kinds, {
        BreakStatement = kinds.Keyword,
        Call = kinds.Function,
        CaseStatement = { fg = C.conditional },
        ContinueStatement = { fg = C.loop },
        Declaration = kinds.Snippet,
        Delete = { fg = C.diff_removed },
        DoStatement = { fg = C.loop },
        ElseStatement = { fg = C.conditional },
        ForStatement = { fg = C.loop },
        Identifier = { fg = C.identifier },
        IfStatement = { fg = C.conditional },
        List = { fg = C.specialchar },
        MarkdownH1 = { link = "rainbow1" },
        MarkdownH2 = { link = "rainbow2" },
        MarkdownH3 = { link = "rainbow3" },
        MarkdownH4 = { link = "rainbow4" },
        MarkdownH5 = { link = "rainbow5" },
        MarkdownH6 = { link = "rainbow6" },
        Repeat = { fg = C.loop },
        Scope = kinds.Namespace,
        Specifier = { fg = C.special },
        Statement = { fg = C.statement },
        SwitchStatement = { fg = C.conditional },
        WhileStatement = { fg = C.loop },
    })

    local dropbar_kinds = {}
    local dropbar_icon_kinds = {}
    for kind, kind_properties in pairs(kinds) do
        local basename_kinds = string.format("DropBarKind%s", kind)
        local basename_icon_kinds = string.format("DropBarIconKind%s", kind)
        dropbar_kinds[basename_kinds] = color and kind_properties or { fg = C.foreground }
        dropbar_icon_kinds[basename_icon_kinds] = kind_properties
    end

    return vim.tbl_deep_extend("force", dropbar_kinds, dropbar_icon_kinds, {
        DropBarHover = { link = "Visual" },
        DropBarMenuHoverEntry = { link = "DropBarMenuHover" },
        DropBarMenuHoverIcon = { reverse = true },
        DropBarMenuHoverSymbol = { bold = true },
        DropBarIconUISeparator = { fg = C.color8 },
        DropBarMenuCurrentContext = { link = "CursorLine" },
        DropBarMenuNormalFloat = { link = "NormalFloat" },
        DropBarMenuFloatBorder = { link = "FloatBorder" },
        DropBarFzfMatch = { fg = C.color5 },
        DropBarCurrentContext = { link = "Visual" },
    })
end

return M

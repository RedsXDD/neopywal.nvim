local M = {}

function M.get()
    local saga_kinds = require("neopywal.utils.kinds").get("Saga%s", { styles = O.plugins.lspsaga.winbar_style or {} })
    local lsp_kinds = require("neopywal.utils.kinds").get("LspKind%s")
    return vim.tbl_deep_extend("force", saga_kinds, lsp_kinds, {
        -- General.
        SagaBeacon = { bg = U.blend(C.color4, C.background, 0.2) },
        RenameNormal = { fg = C.foreground },
        SagaActionTitle = { bg = C.color6, fg = C.background, styles = { "bold", "italic" } },
        SagaImpIcon = { fg = C.color1 },
        SagaButton = { link = "SagaActionTitle" },
        SagaLightBulb = { link = "DiagnosticHint" },
        SagaToggle = { link = "SagaInCurrent" },

        -- Winbar.
        SagaFolderName = {
            fg = O.plugins.lspsaga.dim_folder and C.comment or C.foreground,
            styles = O.plugins.lspsaga.winbar_style or {},
        },
        SagaFileName = {
            fg = O.plugins.lspsaga.dim_filename and C.comment or C.foreground,
            styles = O.plugins.lspsaga.winbar_style or {},
        },
        SagaSep = {
            fg = O.plugins.lspsaga.dim_separator and C.comment or C.foreground,
            styles = O.plugins.lspsaga.winbar_style or {},
        },
        SagaWinbarSep = { link = "SagaSep" },

        -- Finder.
        SagaText = { fg = C.comment },
        SagaFinderFname = { fg = C.func },
        SagaCount = { fg = C.color6 },
        SagaInCurrent = { fg = C.comment },
        SagaSpinner = { fg = C.color4 },
        SagaSpinnerTitle = { link = "SagaSpinner" },

        -- Code actions.
        SagaSelect = { fg = C.color4, styles = { "bold", "italic" } },
        CodeActionText = { fg = C.comment },
        SagaVirtLine = { fg = C.comment },
    })
end

function M.get_kinds()
    return {
        Array = { " ", "LspKindArray" },
        Boolean = { "󰨙 ", "LspKindBoolean" },
        Class = { " ", "LspKindClass" },
        Constant = { "󰏿 ", "LspKindConstant" },
        Constructor = { " ", "LspKindConstructor" },
        Enum = { " ", "LspKindEnum" },
        EnumMember = { " ", "LspKindEnumMember" },
        Event = { " ", "LspKindEvent" },
        Field = { " ", "LspKindField" },
        File = { "󰈙 ", "LspKindFile" },
        Folder = { " ", "LspKindFolder" },
        Function = { "󰊕 ", "LspKindFunction" },
        Interface = { " ", "LspKindInterface" },
        Key = { "󰌋 ", "LspKindKey" },
        Macro = { " ", "LspKindMacro" },
        Method = { "󰊕 ", "LspKindMethod" },
        Module = { " ", "LspKindModule" },
        Namespace = { "󰦮 ", "LspKindNamespace" },
        Null = { " ", "LspKindNull" },
        Number = { "󰎠 ", "LspKindNumber" },
        Object = { " ", "LspKindObject" },
        Operator = { "󰆕 ", "LspKindOperator" },
        Package = { "󰏖 ", "LspKindPackage" },
        Parameter = { " ", "LspKindParameter" },
        Property = { "󰜢 ", "LspKindProperty" },
        Snippet = { " ", "LspKindSnippet" },
        StaticMethod = { "󰠄 ", "LspKindStaticMethod" },
        String = { "󰀬 ", "LspKindString" },
        Struct = { "󰆼 ", "LspKindStruct" },
        Text = { "󰉿 ", "LspKindText" },
        TypeAlias = { " ", "LspKindTypeAlias" },
        TypeParameter = { "󰊄 ", "LspKindTypeParameter" },
        Unit = { "󰑭 ", "LspKindUnit" },
        Value = { " ", "LspKindValue" },
        Variable = { "󰀫 ", "LspKindVariable" },
    }
end

return M

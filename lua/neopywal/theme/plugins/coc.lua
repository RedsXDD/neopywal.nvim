local M = {}

function M.get()
    return {
        CocHighlightText = { styles = { "bold" } },
        CocHoverRange = { styles = { "bold", "underline" } },
        CocHintHighlight = { fg = C.color2, styles = { "undercurl" } },
        CocErrorFloat = { bg = C.color8, fg = C.color1 },
        CocWarningFloat = { bg = C.color8, fg = C.color3 },
        CocInfoFloat = { bg = C.color8, fg = C.color4 },
        CocHintFloat = { bg = C.color8, fg = C.color2 },
        CocCodeLens = { fg = C.color8 },
        CocErrorSign = { link = "DiffDelete" },
        CocWarningSign = { fg = C.color3 },
        CocInfoSign = { fg = C.color4 },
        CocHintSign = { link = "Label" },
        CocErrorHighlight = { fg = C.color1, styles = { "undercurl" } },
        CocWarningHighlight = { fg = C.color3, styles = { "undercurl" } },
        CocInfoHighlight = { fg = C.color4, styles = { "undercurl" } },
        CocWarningVirtualText = { fg = C.color8 },
        CocErrorVirtualText = { fg = C.color8 },
        CocInfoVirtualText = { fg = C.color8 },
        CocHintVirtualText = { fg = C.color8 },
        CocGitAddedSign = { link = "DiffAdd" },
        CocGitChangeRemovedSign = { fg = C.color5 },
        CocGitChangedSign = { link = "DiffChange" },
        CocGitRemovedSign = { link = "DiffDelete" },
        CocGitTopRemovedSign = { link = "CocGitRemovedSign" },
        CocExplorerBufferRoot = { fg = C.color1 },
        CocExplorerBufferExpandIcon = { fg = C.color4 },
        CocExplorerBufferBufnr = { fg = C.color3 },
        CocExplorerBufferModified = { fg = C.color1 },
        CocExplorerBufferBufname = { fg = C.color8 },
        CocExplorerBufferFullpath = { fg = C.color8 },
        CocExplorerFileRoot = { fg = C.color1 },
        CocExplorerFileExpandIcon = { fg = C.color4 },
        CocExplorerFileFullpath = { fg = C.color8 },
        CocExplorerFileDirectory = { link = "Directory" },
        CocExplorerFileGitStage = { fg = C.color4 },
        CocExplorerFileGitUnstage = { fg = C.color3 },
        CocExplorerFileSize = { fg = C.color4 },
        CocExplorerTimeAccessed = { fg = C.color5 },
        CocExplorerTimeCreated = { fg = C.color5 },
        CocExplorerTimeModified = { fg = C.color5 },
        CocExplorerFileRootName = { fg = U.blend(C.color1, C.color3, 0.5) },
        CocExplorerBufferNameVisible = { link = "Directory" },
    }
end

return M

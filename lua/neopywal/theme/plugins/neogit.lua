local M = {}

function M.get()
    return {
        -- General:
        NeogitBranch = { fg = C.color1, bold = true },
        NeogitBranchHead = { fg = C.color1, styles = { "bold", "underline" } },
        NeogitCommitViewHeader = { bg = C.color4, fg = C.background, bold = true },
        NeogitFilePath = { link = "Directory" },
        NeogitFloatHeader = { bg = C.background, fg = C.color5, bold = true },
        NeogitFloatHeaderHighlight = { link = "NeogitFloatHeader" },
        NeogitObjectId = { fg = U.blend(C.color1, C.color3, 0.3) },
        NeogitRemote = { fg = C.color2, bold = true },
        NeogitSectionHeader = { link = "Title" },
        NeogitTagDistance = { fg = U.blend(C.color1, C.color3, 0.2) },
        NeogitTagName = { fg = C.color3 },
        NeogitUnpulledFrom = { fg = C.color2 },
        NeogitUnpushedTo = { fg = C.color6 },

        -- Change.
        NeogitChangeAdded = { fg = C.diff_added, styles = { "bold", "italic" } },
        NeogitChangeCopied = { link = "NeogitChangeModified" },
        NeogitChangeDeleted = { fg = C.diff_removed, styles = { "bold", "italic" } },
        NeogitChangeModified = { fg = C.diff_changed, styles = { "bold", "italic" } },
        NeogitChangeNewFile = { link = "NeogitChangeAdded" },
        NeogitChangeRenamed = { link = "NeogitChangeModified" },
        NeogitChangeUnmerged = { fg = C.warn, styles = { "bold", "italic" } },
        NeogitChangeUpdated = { link = "NeogitChangeModified" },

        -- Diff.
        NeogitDiffAddCursor = { bg = C.background, fg = C.diff_added, bold = true },
        NeogitDiffAdd = { bg = U.blend(C.diff_added, C.background, 0.2), fg = C.diff_added, bold = true },
        NeogitDiffAddHighlight = { link = "NeogitDiffAdd" },
        NeogitDiffAdditions = { fg = C.diff_added, bold = true },
        NeogitDiffContextCursor = { link = "NeogitDiffContext" },
        NeogitDiffContext = { bg = C.background },
        NeogitDiffContextHighlight = { link = "Cursorline" },
        NeogitDiffDeleteCursor = { bg = C.background, fg = C.diff_removed, bold = true },
        NeogitDiffDelete = { bg = U.blend(C.diff_removed, C.background, 0.2), fg = C.diff_removed, bold = true },
        NeogitDiffDeleteHighlight = { link = "NeogitDiffDelete" },
        NeogitDiffDeletions = { fg = C.diff_removed, bold = true },
        NeogitDiffHeader = { link = "Title" },
        NeogitDiffHeaderHighlight = { link = "NeogitDiffHeader" },

        -- Graph.
        NeogitGraphAuthor = { fg = C.color1 },
        NeogitGraphBlue = { fg = C.color4 },
        NeogitGraphCyan = { fg = C.color6 },
        NeogitGraphGray = { fg = C.color8 },
        NeogitGraphGreen = { fg = C.color2 },
        NeogitGraphOrange = { fg = U.blend(C.color1, C.color3, 0.5) },
        NeogitGraphPurple = { fg = C.color5 },
        NeogitGraphRed = { fg = C.color1 },
        NeogitGraphWhite = { fg = C.foreground },
        NeogitGraphYellow = { fg = C.color3 },
        NeogitGraphBoldBlue = { fg = C.color4, bold = true },
        NeogitGraphBoldCyan = { fg = C.color6, bold = true },
        NeogitGraphBoldGray = { fg = C.color8, bold = true },
        NeogitGraphBoldGreen = { fg = C.color2, bold = true },
        NeogitGraphBoldOrange = { fg = U.blend(C.color1, C.color3, 0.5), bold = true },
        NeogitGraphBoldPurple = { fg = C.color5, bold = true },
        NeogitGraphBoldRed = { fg = C.color1, bold = true },
        NeogitGraphBoldWhite = { fg = C.foreground, bold = true },
        NeogitGraphBoldYellow = { fg = C.color3, bold = true },

        -- Hunk.
        NeogitHunkHeader = { bg = U.blend(C.color4, C.background, 0.2), fg = C.color4, bold = true },
        NeogitHunkHeaderCursor = { bg = C.background, fg = C.color4, bold = true },
        NeogitHunkHeaderHighlight = { link = "NeogitHunkHeader" },
        NeogitHunkMergeHeader = { bg = U.blend(C.color2, C.background, 0.2), fg = C.color2, bold = true },
        NeogitHunkMergeHeaderCursor = { bg = C.background, fg = C.color2, bold = true },
        NeogitHunkMergeHeaderHighlight = { link = "NeogitHunkMergeHeader" },

        -- Popup.
        NeogitPopupActionKey = { fg = C.color5 },
        NeogitPopupBold = { bold = true },
        NeogitPopupConfigKey = { link = "NeogitPopupActionKey" },
        NeogitPopupOptionKey = { link = "NeogitPopupActionKey" },
        NeogitPopupSwitchKey = { link = "NeogitPopupActionKey" },
        NeogitPopupBranchName = { link = "NeogitBranch" },
        NeogitPopupConfigEnabled = { fg = C.ok },
        NeogitPopupOptionEnabled = { fg = C.ok },
        NeogitPopupSectionTitle = { fg = C.color4 },
        NeogitPopupSwitchEnabled = { fg = C.ok },
    }
end

return M

local M = {}

function M.get()
    return {
        -- General:
        DiffviewPrimary = { fg = C.color4 },
        DiffviewSecondary = { fg = U.blend(C.color1, C.color3, 0.5) },
        DiffviewDim1 = { fg = C.comment },

        -- Diff:
        DiffviewDiffAddAsDelete = { fg = C.diff_removed },
        DiffviewReference = { fg = C.func },
        DiffviewStatusIgnored = { fg = C.unnecessary },
        DiffviewStatusBroken = { fg = C.error },
        DiffviewStatusDeleted = { fg = C.diff_removed },
        DiffviewStatusUnknown = { fg = C.diff_untracked },
        DiffviewStatusUnmerged = { fg = C.warn },
        DiffviewStatusTypeChange = { fg = C.warn },
        DiffviewStatusCopied = { fg = C.warn },
        DiffviewStatusRenamed = { fg = C.diff_changed },
        DiffviewStatusModified = { fg = C.diff_changed },
        DiffviewStatusUntracked = { fg = C.diff_untracked },
        DiffviewStatusAdded = { fg = C.diff_added },
        DiffviewReflogSelector = { fg = C.special },
        DiffviewHash = { fg = C.identifier },

        -- File explorer:
        DiffviewWinSeparator = {
            bg = O.transparent_background and C.none or C.background,
            fg = C.color8,
        },
        DiffviewFilePanelFileName = { fg = C.foreground },
        DiffviewFilePanelCounter = { fg = C.color6 },
        DiffviewFilePanelTitle = { link = "Title" },
        DiffviewFolderSign = { link = "Directory" },
        DiffviewFilePanelConflicts = { fg = C.warn },
        DiffviewFilePanelInsertions = { fg = C.diff_added },
        DiffviewFilePanelSelected = { fg = C.identifier },
        DiffviewFilePanelDeletions = { fg = C.diff_removed },
        DiffviewFilePanelPath = { link = "DiffviewDim1" },
        DiffviewDiffDeleteDim = { link = "DiffviewDim1" },
    }
end

return M

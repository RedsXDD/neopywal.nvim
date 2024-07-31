local M = {}

function M.get()
    return {
        NvimTreeFolderIcon = { link = "Directory" },
        NvimTreeExecFile = { fg = C.keyword },
        NvimTreeImageFile = { fg = C.foreground },
        NvimTreeSpecialFile = { fg = C.special },
        NvimTreeSymlink = { fg = C.color6 },
        NvimTreeSymlinkIcon = { link = "NvimTreeSymlink" },
        NvimTreePopup = { link = "NormalFloat" },
        NvimTreeNormal = { link = "Normal" },
        NvimTreeNormalNC = { link = "NormalNC" },
        NvimTreeIndentMarker = { fg = C.comment },
        NvimTreeGitDirty = { fg = C.warn },
        NvimTreeGitNew = { fg = C.diff_added },
        NvimTreeGitDeleted = { fg = C.diff_removed },
    }
end

return M

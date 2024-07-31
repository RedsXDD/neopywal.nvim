local M = {}

function M.get()
    local ret = {
        LirFloatNormal = { link = "NormalFloat" },
        LirDir = { link = "Directory" },
        LirSymLink = { fg = C.color6 },
        LirEmptyDirText = { link = "Directory" },
        LirFloatCurdirWindowNormal = { fg = C.foreground },
        LirFloatCurdirWindowDirName = { fg = C.color5, bold = true },
        LirFloatBorder = { link = "FloatBorder" },
        LirFloatCursorLine = { link = "CursorLine" },
        DevIconLirFolderNode = { link = "Directory" },
    }

    if O.plugins.lir.git_status then
        ret = vim.tbl_deep_extend("keep", ret, {
            LirGitStatusBracket = { fg = C.special },
            LirGitStatusIndex = { fg = C.color6 },
            LirGitStatusWorktree = { fg = C.color3 },
            LirGitStatusUnmerged = { fg = C.warn },
            LirGitStatusUntracked = { fg = C.diff_untracked },
            LirGitStatusIgnored = { fg = C.unnecessary },
        })
    end

    return ret
end

return M

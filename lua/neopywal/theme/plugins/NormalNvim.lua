local M = {}

function M.get()
    return {
        MarkdownTask = { fg = C.color6, styles = { "bold" } },
        MarkdownTodo = { fg = C.color4, styles = { "bold" } },
        MarkdownNote = { bg = C.info, styles = { "bold" } },
        MarkdownSee = { fg = C.warn, styles = { "bold" } },
        MarkdownCheck = { fg = C.ok, styles = { "bold" } },
        MarkdownURL = { link = "URLlink" },
        MarkdownExample = { fg = C.color5, styles = { "bold" } },
    }
end

return M

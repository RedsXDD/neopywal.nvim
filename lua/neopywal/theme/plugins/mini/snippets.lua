local M = {}

function M.get()
    return {
        MiniSnippetsCurrent = { sp = C.warn, styles = O.plugins.mini.snippets.style or {} },
        MiniSnippetsCurrentReplace = { sp = C.color1, styles = O.plugins.mini.snippets.style or {} },
        MiniSnippetsFinal = { sp = C.color2, styles = O.plugins.mini.snippets.style or {} },
        MiniSnippetsUnvisited = { sp = C.color6, styles = O.plugins.mini.snippets.style or {} },
        MiniSnippetsVisited = { sp = C.color4, styles = O.plugins.mini.snippets.style or {} },
    }
end

return M

local M = {}

function M.get()
    return {
        TodoSignFIX = { fg = C.error },
        TodoFgFIX = { fg = C.error, styles = O.plugins.todo_comments.style.fix or {} },
        TodoBgFIX = { bg = C.error, fg = C.background, styles = O.plugins.todo_comments.style.fix or {} },

        TodoSignHACK = { fg = C.hint },
        TodoFgHACK = { fg = C.hint, styles = O.plugins.todo_comments.style.hack or {} },
        TodoBgHACK = { bg = C.hint, fg = C.background, styles = O.plugins.todo_comments.style.hack or {} },

        TodoSignTODO = { fg = C.color4 },
        TodoFgTODO = { fg = C.color4, styles = O.plugins.todo_comments.style.todo or {} },
        TodoBgTODO = { bg = C.color4, fg = C.background, styles = O.plugins.todo_comments.style.todo or {} },

        TodoSignNOTE = { fg = C.info },
        TodoFgNOTE = { fg = C.info, styles = O.plugins.todo_comments.style.note or {} },
        TodoBgNOTE = { bg = C.info, fg = C.background, styles = O.plugins.todo_comments.style.note or {} },

        TodoSignPERF = { fg = C.ok },
        TodoFgPERF = { fg = C.ok, styles = O.plugins.todo_comments.style.perf or {} },
        TodoBgPERF = { bg = C.ok, fg = C.background, styles = O.plugins.todo_comments.style.perf or {} },

        TodoSignTEST = { fg = C.unnecessary },
        TodoFgTEST = { fg = C.unnecessary, styles = O.plugins.todo_comments.style.test or {} },
        TodoBgTEST = { bg = C.unnecessary, fg = C.background, styles = O.plugins.todo_comments.style.test or {} },

        TodoSignWARN = { fg = C.warn },
        TodoFgWARN = { fg = C.warn, styles = O.plugins.todo_comments.style.warn or {} },
        TodoBgWARN = { bg = C.warn, fg = C.background, styles = O.plugins.todo_comments.style.warn or {} },
    }
end

return M

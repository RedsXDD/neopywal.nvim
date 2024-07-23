local M = {}

function M.get()
    return {
        MiniHipatternsFixme = {
            bg = C.error,
            fg = C.background,
            styles = O.plugins.mini.hipatterns.style.fixme or {},
        },
        MiniHipatternsHack = {
            bg = C.warn,
            fg = C.background,
            styles = O.plugins.mini.hipatterns.style.hack or {},
        },
        MiniHipatternsTodo = {
            bg = C.color4,
            fg = C.background,
            styles = O.plugins.mini.hipatterns.style.todo or {},
        },
        MiniHipatternsNote = {
            bg = C.foreground,
            fg = C.background,
            styles = O.plugins.mini.hipatterns.style.note or {},
        },
    }
end

return M

local M = {}

function M.get()
    return {
        VimwikiLink = { link = "URLlink" },
        VimwikiHeaderChar = { fg = C.color8 },
        VimwikiHR = { fg = C.color3 },
        VimwikiList = { fg = C.identifier },
        VimwikiTag = { fg = C.color5 },
        VimwikiMarkers = { fg = C.comment },
        VimwikiMarkTag = { bg = C.identifier, fg = C.background },

        VimwikiHeader1 = { link = "rainbow1" },
        VimwikiHeader2 = { link = "rainbow2" },
        VimwikiHeader3 = { link = "rainbow3" },
        VimwikiHeader4 = { link = "rainbow4" },
        VimwikiHeader5 = { link = "rainbow5" },
        VimwikiHeader6 = { link = "rainbow6" },

        Vimwikibpurple = { bg = C.color5 },
        Vimwikidefault = { bg = C.color3 },
        Vimwikibgreen = { bg = C.color2 },
        Vimwikiborange = { bg = U.blend(C.color1, C.color3, 0.5) },
        Vimwikibgray = { bg = C.color8 },
        Vimwikibblue = { bg = C.color4 },
        Vimwikibred = { bg = C.color1 },
        Vimwikibyellow = { bg = C.color3 },

        Vimwikigreen = { fg = C.color2 },
        Vimwikigray = { fg = C.color8 },
        Vimwikiyellow = { fg = C.color3 },
        Vimwikired = { fg = C.color1 },
        Vimwikipurple = { fg = C.color5 },
        Vimwikiorange = { fg = U.blend(C.color1, C.color3, 0.5) },
        Vimwikiblue = { fg = C.color4 },
    }
end

return M

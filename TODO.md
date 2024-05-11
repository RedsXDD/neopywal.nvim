- Add support for the following user options:
    color_overrides = {
        background = "",
        foreground = "",
        color0 = "",
        color1 = "",
        color2 = "",
        color3 = "",
        color4 = "",
        color5 = "",
        color6 = "",
        color7 = "",
        color8 = "",
        color9 = "",
        color10 = "",
        color11 = "",
        color12 = "",
        color13 = "",
        color14 = "",
        color15 = "",
    },
    transparent_background = false, -- disables setting the background color.
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },

- Add support for the following plugins:

    - Some of catppuccin.nvim and tokyonight.nvim supportted plugins such as nvim-ufo.

    RRethy/vim-illuminate
    highlight! link illuminatedWord CocHighlightText

    APZelos/blamer.nvim
    highlight! link Blamer Grey

    junegunn/vim-plug
    call s:HL("plug1", s:palette.red, s:palette.none, "bold")
    call s:HL("plugNumber", s:palette.yellow, s:palette.none, "bold")
    highlight! link plug2 Blue
    highlight! link plugBracket Blue
    highlight! link plugName Green
    highlight! link plugDash Red
    highlight! link plugNotLoaded Grey
    highlight! link plugH2 Purple
    highlight! link plugMessage Purple
    highlight! link plugError Red
    highlight! link plugRelDate Grey
    highlight! link plugStar Purple
    highlight! link plugUpdate Blue
    highlight! link plugDeleted Grey
    highlight! link plugEdge Purple

    neomake/neomake
    highlight! link NeomakeError ALEError
    highlight! link NeomakeErrorSign ALEErrorSign
    highlight! link NeomakeWarning ALEWarning
    highlight! link NeomakeWarningSign ALEWarningSign
    highlight! link NeomakeInfo ALEInfo
    highlight! link NeomakeInfoSign ALEInfoSign
    highlight! link NeomakeMessage ALEInfo
    highlight! link NeomakeMessageSign CocHintSign
    highlight! link NeomakeVirtualtextError Grey
    highlight! link NeomakeVirtualtextWarning Grey
    highlight! link NeomakeVirtualtextInfo Grey
    highlight! link NeomakeVirtualtextMessag Grey

    junegunn/fzf.vim
    let g:fzf_colors = {
          \ "fg": ["fg", "Normal"],
          \ "bg": ["bg", "Normal"],
          \ "hl": ["fg", "Green"],
          \ "fg+": ["fg", "CursorLine", "CursorColumn", "Normal"],
          \ "bg+": ["bg", "CursorLine", "CursorColumn"],
          \ "hl+": ["fg", "Green"],
          \ "info": ["fg", "Yellow"],
          \ "prompt": ["fg", "Red"],
          \ "pointer": ["fg", "Blue"],
          \ "marker": ["fg", "Blue"],
          \ "spinner": ["fg", "Yellow"],
          \ "header": ["fg", "Blue"]
          \ }

    Shougo/denite.nvim
    call s:HL("deniteMatchedChar", s:palette.green, s:palette.none, "bold")
    call s:HL("deniteMatchedRange", s:palette.green, s:palette.none, "bold,underline")
    call s:HL("deniteInput", s:palette.green, s:palette.bg1, "bold")
    call s:HL("deniteStatusLineNumber", s:palette.purple, s:palette.bg1)
    call s:HL("deniteStatusLinePath", s:palette.fg, s:palette.bg1)
    highlight! link deniteSelectedLine Green

local M = {}

function M.get()
    return {
        OctoBlue = { fg = C.color4 },
        OctoGreen = { fg = C.color2 },
        OctoGrey = { fg = C.color8 },
        OctoPurple = { fg = C.color5 },
        OctoRed = { fg = C.color1 },
        OctoYellow = { fg = C.color3 },

        OctoBubble = { bg = C.background, fg = C.foreground },
        OctoBubbleBlue = { bg = C.color4, fg = C.background },
        OctoBubbleGreen = { bg = C.color2, fg = C.background },
        OctoBubbleGrey = { bg = C.background, fg = C.foreground },
        OctoBubblePurple = { bg = C.color5, fg = C.background },
        OctoBubbleRed = { bg = C.color1, fg = C.background },
        OctoBubbleYellow = { bg = C.color3, fg = C.background },

        OctoBubbleDelimiterBlue = { fg = C.color4 },
        OctoBubbleDelimiterGreen = { fg = C.color2 },
        OctoBubbleDelimiterGrey = { fg = C.color8 },
        OctoBubbleDelimiterPurple = { fg = C.color5 },
        OctoBubbleDelimiterRed = { fg = C.color1 },
        OctoBubbleDelimiterYellow = { fg = C.color3 },

        OctoFloat = { link = "NormalNC" },
        OctoBlueFloat = { bg = C.background, fg = C.color4 },
        OctoGreenFloat = { bg = C.background, fg = C.color2 },
        OctoGreyFloat = { bg = C.background, fg = C.color8 },
        OctoPurpleFloat = { bg = C.background, fg = C.color5 },
        OctoRedFloat = { bg = C.background, fg = C.color1 },
        OctoYellowFloat = { bg = C.background, fg = C.color3 },

        OctoDirty = { link = "ErrorMsg" },
        OctoEditable = { bg = C.background },
        OctoEmpty = { link = "Comment" },
        OctoFilePanelCounter = { fg = C.color6, styles = { "bold" } },
        OctoFilePanelFileName = { link = "NormalFloat" },
        OctoFilePanelTitle = { link = "Title" },
        OctoIssueId = { link = "Question" },
        OctoNormalFront = { fg = C.foreground },
        OctoStateApproved = { link = "OctoStateOpen" },
        OctoStateChangesRequested = { bg = C.background, fg = C.warn },
        OctoStateClosedFloat = { link = "OctoRedFloat" },
        OctoStateClosed = { link = "OctoRedFloat" },
        OctoStateCommented = { link = "Normal" },
        OctoStateDismissedFloat = { link = "OctoStateClosed" },
        OctoStateDismissed = { link = "OctoStateClosed" },
        OctoViewer = { bg = C.color4, fg = C.background },
    }
end

return M

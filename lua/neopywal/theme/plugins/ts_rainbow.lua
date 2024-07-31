local M = {}

function M.get()
    return {
        rainbowcol1 = { fg = require("neopywal.utils.rainbow").get()[1] },
        rainbowcol2 = { fg = require("neopywal.utils.rainbow").get()[2] },
        rainbowcol3 = { fg = require("neopywal.utils.rainbow").get()[3] },
        rainbowcol4 = { fg = require("neopywal.utils.rainbow").get()[4] },
        rainbowcol5 = { fg = require("neopywal.utils.rainbow").get()[5] },
        rainbowcol6 = { fg = require("neopywal.utils.rainbow").get()[6] },
        rainbowcol7 = { fg = require("neopywal.utils.rainbow").get()[7] },
    }
end

return M

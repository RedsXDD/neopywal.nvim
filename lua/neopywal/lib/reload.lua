local M = {}
local G = require("neopywal.lib.config").compiler
local notify = require("neopywal.utils.notify")
local compiler = require("neopywal.lib.compiler")
local palette = require("neopywal.lib.palette")

function M.recompile()
    for name, _ in pairs(package.loaded) do
        if name:match("^neopywal.") then package.loaded[name] = nil end
    end
    compiler.compile()
    notify.info("Successfully compiled cache.")
    vim.cmd.colorscheme("neopywal")
end

M.lock = false
function M.init()
    if M.lock then return end
    M.lock = true

    if not palette.did_setup then palette.setup("", "", false, {}) end

    vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = { "*/neopywal/*", "*/neopywal.lua" },
        callback = function()
            vim.schedule(function() M.recompile() end)
        end,
    })

    ---@diagnostic disable-next-line: undefined-field
    local event = vim.uv.new_fs_event()
    local template_path = palette.colorscheme_file
    event:start(template_path, {
        watch_entry = true,
        stat = true,
    }, function(err)
        if err then
            local err_path = (G.path_sep == "/" and "/tmp" or os.getenv("TMP"))
                .. G.path_sep
                .. "neopywal_reload_error.lua"
            notify.error(string.format(
                [[
An error occurred when trying to live reload the colorscheme while using the template file "%s"
You can open %s for debugging

If you think this is a bug, kindly open an issue and attach %s file
Below is the error message that we captured:
        ]],
                template_path,
                err_path,
                err_path
            ))

            local err_file = io.open(err_path, "wb")
            if err_file then
                err_file:write(err)
                err_file:close()
            end
            event:stop()
        end

        vim.schedule(function()
            notify.info(
                string.format([[Change detected in template file "%s", recompiling colorscheme.]], template_path)
            )
            M.recompile()
        end)
    end)
end

return M

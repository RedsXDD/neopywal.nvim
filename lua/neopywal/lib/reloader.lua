local M = {}
local Notify = require("neopywal.utils.notify")
local Compiler = require("neopywal.lib.compiler")
local Palette = require("neopywal.lib.palette")

M.lock = false
function M.init()
    if M.lock then return end
    M.lock = true

    if not Palette.did_setup then Palette.setup() end

    if vim.g.neopywal_debug then
        vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = { "*/neopywal/*", "*/neopywal.lua" },
            callback = function()
                vim.schedule(function() Compiler.recompile() end)
            end,
        })
    end

    ---@diagnostic disable-next-line: undefined-field
    local event = vim.uv.new_fs_event()
    local bg = vim.o.background
    local template_path = Palette.options.use_palette[bg]
    event:start(template_path, {
        watch_entry = true,
        stat = true,
    }, function(err)
        if err then
            local err_path = (Compiler.options.path_sep == "/" and "/tmp" or os.getenv("TMP"))
                .. Compiler.options.path_sep
                .. "neopywal_reload_error.lua"
            Notify.error(string.format(
                [[
An error occurred when trying to reload the colorscheme with the "%s" template file.
You can open %s for debugging

If you think this is a bug, kindly open an issue and attach %s file
Below is the error message that we captured:
%s
        ]],
                template_path,
                err_path,
                err_path,
                err
            ))

            local err_file = io.open(err_path, "wb")
            if err_file then
                err_file:write(err)
                err_file:close()
            end
            event:stop()
        end

        vim.schedule(function()
            if not vim.g.colors_name:match("^neopywal") then
                M.lock = false
                package.loaded["neopywal.lib.reloader"] = nil
                return
            end

            Notify.info(
                string.format([[Change detected in template file "%s", recompiling colorscheme.]], template_path)
            )
            Compiler.recompile()
        end)
    end)
end

return M

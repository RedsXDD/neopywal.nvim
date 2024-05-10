local M = {
	defaults_options = {
		default_fileformats = true,
		filetypes = {
			cpp = true,
		},
		default_plugins = true,
		plugins = {
			mini = {
				starter = false,
			},
		},
	},
}

M.options = M.defaults_options

function M.setup(user_conf)
	-- User configuration setup steps:
	user_conf = user_conf or {}
	if user_conf.default_fileformats == false then M.default_options.fileformats = {} end
	if user_conf.default_plugins == false then M.default_options.plugins = {} end
	M.options = vim.tbl_deep_extend("keep", user_conf, M.default_options)
end

return M

---@diagnostic disable: undefined-global, undefined-field
local function reload()
	for name, _ in pairs(package.loaded) do
		if name:match("^neopywal") then
			package.loaded[name] = nil
		end
	end
	vim.cmd([[highlight clear]])
end

describe("get colors", function()
	before_each(function()
		reload()
	end)
	it("before setup", function()
		assert.equals(
			pcall(function()
				require("neopywal").get_colors()
			end),
			true
		)
	end)
	it("after setup", function()
		require("neopywal").setup()
		assert.equals(
			pcall(function()
				require("neopywal").get_colors()
			end),
			true
		)
	end)
end)

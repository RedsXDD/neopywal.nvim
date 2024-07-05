---@diagnostic disable: undefined-global, undefined-field
describe("hash", function()
	local hash = require("neopywal.lib.hashing").hash
	it("typo", function()
		assert.are_not.equals(hash({ custom_highlight = {} }), hash({ ustom_highlight = {} }))
	end)
	it("when table order is shuffled", function()
		assert.equals(
			hash({
				custom_highlight = {
					Search = { fg = "#ff0000", bg = "#000000", style = { "bold" } },
					IncSearch = { fg = "#000000", bg = "#ff0000" },
				},
			}),
			hash({
				custom_highlight = {
					Search = { style = { "bold" }, bg = "#000000", fg = "#ff0000" },
					IncSearch = { bg = "#ff0000", fg = "#000000" },
				},
			})
		)
	end)
	it("when toggle true/false", function()
		assert.are_not.equals({
			fileformats = {
				c_cpp = true,
				c_sharp = true,
				clojure = true,
			},
			plugins = {
				alpha = true,
				noice = true,
				dashboard = true,
			},
		}, {
			fileformats = {
				c_cpp = true,
				c_sharp = false,
				clojure = false,
			},
			integrations = {
				alpha = true,
				noice = false,
				dashboard = false,
			},
		})
	end)
end)

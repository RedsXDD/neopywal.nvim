---@diagnostic disable: undefined-global, undefined-field
describe("loading respects vim.o.background", function()
    before_each(function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("default")
        require("neopywal").setup()
    end)

    it("and did proper init", function()
        assert.same("default", vim.g.colors_name)
        assert.same("dark", vim.o.background)
    end)

    it("= dark", function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("neopywal")
        assert.same("dark", vim.o.background)
        assert.same("neopywal-dark", vim.g.colors_name)
    end)

    it("= light", function()
        vim.o.background = "light"
        vim.cmd.colorscheme("neopywal")
        assert.same("light", vim.o.background)
        assert.same("neopywal-light", vim.g.colors_name)
    end)

    it("= dark with dark", function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("neopywal-dark")
        assert.same("dark", vim.o.background)
        assert.same("neopywal-dark", vim.g.colors_name)
    end)

    it("= dark with light", function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("neopywal-light")
        assert.same("light", vim.o.background)
        assert.same("neopywal-light", vim.g.colors_name)
    end)

    it("= light with dark", function()
        vim.o.background = "light"
        vim.cmd.colorscheme("neopywal-dark")
        assert.same("dark", vim.o.background)
        assert.same("neopywal-dark", vim.g.colors_name)
    end)

    it("= light with light", function()
        vim.o.background = "light"
        vim.cmd.colorscheme("neopywal-light")
        assert.same("light", vim.o.background)
        assert.same("neopywal-light", vim.g.colors_name)
    end)

    it("= dark and switches to light", function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("neopywal")
        vim.o.background = "light"
        assert.same("light", vim.o.background)
        assert.same("neopywal-light", vim.g.colors_name)
    end)

    it("= light and switches to dark", function()
        vim.o.background = "light"
        vim.cmd.colorscheme("neopywal")
        vim.o.background = "dark"
        assert.same("dark", vim.o.background)
        assert.same("neopywal-dark", vim.g.colors_name)
    end)

    it("= dark, switches to light and remembers dark", function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("neopywal")
        vim.o.background = "light"
        vim.o.background = "dark"
        assert.same("dark", vim.o.background)
        assert.same("neopywal-dark", vim.g.colors_name)
    end)

    it("= light, switches to dark and remembers light", function()
        vim.o.background = "light"
        vim.cmd.colorscheme("neopywal")
        vim.o.background = "dark"
        vim.o.background = "light"
        assert.same("light", vim.o.background)
        assert.same("neopywal-light", vim.g.colors_name)
    end)
end)

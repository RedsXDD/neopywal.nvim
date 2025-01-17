-- vim:fileencoding=utf-8:foldmethod=marker:foldenable

---@diagnostic disable: undefined-global, undefined-field
describe("neopywal respects vim.o.background", function()
    before_each(function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("default")
        require("neopywal").setup()
    end)

    --: and did proper init {{{
    it("and proper init", function()
        assert.same("default", vim.g.colors_name)
        assert.same("dark", vim.o.background)
    end)
    --: }}}
    --: = dark {{{
    it("= dark", function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("neopywal")
        assert.same("dark", vim.o.background)
        assert.same("neopywal-dark", vim.g.colors_name)
    end)
    --: }}}
    --: = light {{{
    it("= light", function()
        vim.o.background = "light"
        vim.cmd.colorscheme("neopywal")
        assert.same("light", vim.o.background)
        assert.same("neopywal-light", vim.g.colors_name)
    end)
    --: }}}
    --: = dark with dark {{{
    it("= dark with dark", function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("neopywal-dark")
        assert.same("dark", vim.o.background)
        assert.same("neopywal-dark", vim.g.colors_name)
    end)
    --: }}}
    --: = dark with light {{{
    it("= dark with light", function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("neopywal-light")
        assert.same("light", vim.o.background)
        assert.same("neopywal-light", vim.g.colors_name)
    end)
    --: }}}
    --: = light with dark {{{
    it("= light with dark", function()
        vim.o.background = "light"
        vim.cmd.colorscheme("neopywal-dark")
        assert.same("dark", vim.o.background)
        assert.same("neopywal-dark", vim.g.colors_name)
    end)
    --: }}}
    --: = light with light {{{
    it("= light with light", function()
        vim.o.background = "light"
        vim.cmd.colorscheme("neopywal-light")
        assert.same("light", vim.o.background)
        assert.same("neopywal-light", vim.g.colors_name)
    end)
    --: }}}
    --: = dark and switches to light {{{
    it("= dark and switches to light", function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("neopywal")
        vim.o.background = "light"
        assert.same("light", vim.o.background)
        assert.same("neopywal-light", vim.g.colors_name)
    end)
    --: }}}
    --: = light and switches to dark {{{
    it("= light and switches to dark", function()
        vim.o.background = "light"
        vim.cmd.colorscheme("neopywal")
        vim.o.background = "dark"
        assert.same("dark", vim.o.background)
        assert.same("neopywal-dark", vim.g.colors_name)
    end)
    --: }}}
    --: = dark, switches to light and remembers dark {{{
    it("= dark, switches to light and remembers dark", function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("neopywal")
        vim.o.background = "light"
        vim.o.background = "dark"
        assert.same("dark", vim.o.background)
        assert.same("neopywal-dark", vim.g.colors_name)
    end)
    --: }}}
    --: = light, switches to dark and remembers light {{{
    it("= light, switches to dark and remembers light", function()
        vim.o.background = "light"
        vim.cmd.colorscheme("neopywal")
        vim.o.background = "dark"
        vim.o.background = "light"
        assert.same("light", vim.o.background)
        assert.same("neopywal-light", vim.g.colors_name)
    end)
    --: }}}
end)

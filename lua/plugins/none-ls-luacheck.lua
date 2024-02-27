return {
    "nvimtools/none-ls.nvim",
    config = function()
        require("null-ls").register(require("none-ls-luacheck.diagnostics.luacheck"))
    end,
    dependencies = {
        "gbprod/none-ls-luacheck.nvim",
    },
  }

return {
    "nvimtools/none-ls.nvim",
    config = function()
        require("null-ls").register(require("none-ls-shellcheck.diagnostics"))
        require("null-ls").register(require("none-ls-shellcheck.code_actions"))
    end,
    dependencies = {
        "gbprod/none-ls-shellcheck.nvim",
    },
  }

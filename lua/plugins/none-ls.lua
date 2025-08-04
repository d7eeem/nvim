return {
  "nvimtools/none-ls.nvim",
  lazy = false,
  dependencies = {
    "mason.nvim",
    "nvimtools/none-ls-extras.nvim",
    "gbprod/none-ls-luacheck.nvim",
    "gbprod/none-ls-shellcheck.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local sources = {
      -- Builtins
      null_ls.builtins.code_actions.gitsigns,
      null_ls.builtins.code_actions.refactoring,
      null_ls.builtins.completion.luasnip,
      null_ls.builtins.diagnostics.actionlint,
      null_ls.builtins.diagnostics.selene,
      null_ls.builtins.diagnostics.markdownlint,
      null_ls.builtins.diagnostics.stylelint,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.shfmt,
      null_ls.builtins.formatting.stylelint,
      null_ls.builtins.formatting.prettier,
    }

    -- Extras (eslint, beautysh, yamllint, jq, yq)
    require("none-ls.code_actions.eslint")
    require("none-ls.diagnostics.eslint")
    require("none-ls.formatting.eslint")
    require("none-ls.formatting.beautysh")
    require("none-ls.diagnostics.yamllint")
    require("none-ls.formatting.jq")
    require("none-ls.formatting.yq")

    -- Luacheck
    null_ls.register(require("none-ls-luacheck.diagnostics.luacheck"))
    -- Shellcheck
    null_ls.register(require("none-ls-shellcheck.diagnostics"))
    null_ls.register(require("none-ls-shellcheck.code_actions"))

    local opts = {
      root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
      sources = sources,
    }
    null_ls.setup(opts)
  end,
}

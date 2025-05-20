return {
  "nvimtools/none-ls.nvim",
  lazy = false,
  dependencies = { "mason.nvim" },
  opts = function(_, opts)
    local null_ls = require("null-ls")
    opts.root_dir = opts.root_dir
        or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
    opts.sources = vim.list_extend(opts.sources or {}, {
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
    })
  end,
}

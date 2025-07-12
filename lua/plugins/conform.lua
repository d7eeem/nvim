return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      markdown = { "prettierd", "prettier" },
      ["markdown.mdx"] = { "prettierd", "prettier" },
      javascript = { "dprint" },
      javascriptreact = { "dprint" },
      typescript = { "dprint" },
      typescriptreact = { "dprint" },
      bash = { "beautysh", "shfmt" },
      jsonc = { "prettierd", "prettier" },
      json = { "prettierd", "prettier" },
      rasi = { "css-lsp" },
      toml = { "taplo" },
    },
    formatters = {
      prettier = {
        require_cwd = true,
      },
      shfmt = {
        prepend_args = { "-i", "2", "-ci" },
      },
      dprint = {
        condition = function(ctx)
          return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
        end,
      },
    },
  },
}

return {
  "stevearc/conform.nvim",
  -- optional = true,
  opts = {
    formatters_by_ft = {
      ["markdown"] = { { "prettierd", "prettier" } },
      ["markdown.mdx"] = { { "prettierd", "prettier" } },
      ["javascript"] = { "dprint" },
      ["javascriptreact"] = { "dprint" },
      ["typescript"] = { "dprint" },
      ["typescriptreact"] = { "dprint" },
      ["bash"] = { "beautysh", "shfmt" },
    },
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2", "-ci" },
      },
      dprint = {
        condition = function(ctx)
          return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })
        end,
      },
    },
  },
}

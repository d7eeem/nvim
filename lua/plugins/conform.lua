return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- Prefer yamlfmt for YAML
      markdown = {"prettierd", "prettier"},
      ["markdown.mdx"] = {"prettierd", "prettier"},
      javascript = {"dprint"},
      javascriptreact = {"dprint"},
      typescript = {"dprint"},
      typescriptreact = {"dprint"},
      bash = {"beautysh", "shfmt"},
      jsonc = {"prettierd", "prettier"},
      json = {"prettierd", "prettier"},
      yaml = {"yamlfmt"},
      rasi = {"css-lsp"},
      toml = {"taplo"},
      fish = {"fish-lsp"},
    },
    formatters = {
      prettier = {
        require_cwd = true,
      },
      shfmt = {
        prepend_args = {"-i", "2", "-ci"},
      },
      dprint = {
        condition = function(ctx)
          return vim.fs.find({"dprint.json"}, {path = ctx.filename, upward = true})[1]
        end,
      },
      yamlfmt = {},
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)
    -- Format on save for supported filetypes
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({bufnr = args.buf, lsp_fallback = true})
      end,
    })
  end,
}

return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = {
      { "<leader>cm", ":Mason<cr>", desc = "Mason" },
    },
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "bicep-lsp",
        "golines",
        "gopls",
        "html-lsp",
        "json-lsp",
        "fixjson",
        "lua-language-server",
        "prettier",
        "stylua",
        "yaml-language-server",
        "lemminx",
        "shfmt",
        "beautysh",
        "selene",
        "luacheck",
        "markdownlint",
        "stylelint",
      },
      registries = {
        "github:mason-org/mason-registry",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local ok, p = pcall(mr.get_package, tool)
          if ok and not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(vim.schedule_wrap(ensure_installed))
      else
        ensure_installed()
      end
    end,
  },
}

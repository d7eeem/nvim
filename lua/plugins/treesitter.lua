return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      init = function()
        require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
        load_textobjects = true
      end,
    },
  },
  cmd = { "TSUpdateSync" },
  keys = {
    { "<c-space>", desc = "Increment selection" },
    { "<bs>",      desc = "Decrement selection", mode = "x" },
  },
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "bash", "bicep", "gitignore", "html", "http", "json", "lua",
      "luadoc", "luap", "markdown", "markdown_inline", "regex", "toml", "yaml",
      "jsonc",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  },
  config = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      local added = {}
      opts.ensure_installed = vim.tbl_filter(function(lang)
        if added[lang] then return false end
        added[lang] = true
        return true
      end, opts.ensure_installed)
    end
    require("nvim-treesitter.configs").setup(opts)

    if load_textobjects and opts.textobjects then
      for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
        if opts.textobjects[mod] and opts.textobjects[mod].enable then
          local Loader = require("lazy.core.loader")
          Loader.disabled_rtp_plugins["nvim-treesitter-textobjects"] = nil
          local plugin = require("lazy.core.config").plugins["nvim-treesitter-textobjects"]
          Loader.source_runtime(plugin.dir, "plugin")
          break
        end
      end
    end
  end,
}

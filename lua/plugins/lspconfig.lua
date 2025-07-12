return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()
    -- Store the original virtual text config for toggling
    local original_virtual_text = {
      spacing = 10,
      prefix = "●",
    }
    
    vim.diagnostic.config({
      virtual_text = original_virtual_text,
      signs = true,
      underline = false,
      update_in_insert = false,
      severity_sort = true,
    })

    -- Toggle virtual text function
    local function toggle_virtual_text()
      local current_config = vim.diagnostic.config()
      if current_config.virtual_text then
        vim.diagnostic.config({ virtual_text = false })
        print("Virtual text disabled")
      else
        vim.diagnostic.config({ virtual_text = original_virtual_text })
        print("Virtual text enabled")
      end
    end

    -- Set up the keymap for toggling virtual text
    vim.keymap.set("n", "<leader>lv", toggle_virtual_text, { desc = "Toggle virtual text" })

    -- Diagnostic signs (gutter icons)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Setup language servers
    local servers = {
      html = {},
      ts_ls = {},
      cssls = {
        filetypes = { "css", "scss", "rasi" }
      },
      tailwindcss = {},
      graphql = {
        filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
      },
      emmet_ls = {
        filetypes = {
          "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte",
        },
      },
      jsonls = {
        filetypes = { "json", "jsonc" },
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      },
      pyright = {},
      taplo = { "toml" },
      bashls = {
        filetypes = { "bash", "sh" }
      },
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      },
    }

    for server, config in pairs(servers) do
      config.capabilities = capabilities
      lspconfig[server].setup(config)
    end
  end,
}

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

    -- Diagnostic signs (gutter icons)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Setup language servers
    local servers = {
      html = {},
      tsserver = {},
      cssls = {},
      tailwindcss = {},
      graphql = {
        filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
      },
      emmet_ls = {
        filetypes = {
          "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte",
        },
      },
      pyright = {},
      bashls = {},
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


-- return {
--   "neovim/nvim-lspconfig",
--   event = { "BufReadPre", "BufNewFile" },
--   dependencies = {
--     "hrsh7th/cmp-nvim-lsp",
--     { "antosha417/nvim-lsp-file-operations", config = true },
--   },
--
--     config = function()
--     local lspconfig = require("lspconfig")
--     local cmp_nvim_lsp = require("cmp_nvim_lsp")
--     -- local opts = { noremap = true, silent = true }
--     --[[ local on_attach = function(client, bufnr)
--       opts.buffer = bufnr
--
--       -- set keybinds
--       opts.desc = "Show LSP references"
--       keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
--
--       opts.desc = "Go to declaration"
--       keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
--
--       opts.desc = "Show LSP definitions"
--       keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
--
--       opts.desc = "Show LSP implementations"
--       keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
--
--       opts.desc = "Show LSP type definitions"
--       keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
--
--       opts.desc = "See available code actions"
--       keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
--
--       opts.desc = "Smart rename"
--       keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
--
--       opts.desc = "Show buffer diagnostics"
--       keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
--
--       opts.desc = "Show line diagnostics"
--       keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
--
--       opts.desc = "Go to previous diagnostic"
--       keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
--
--       opts.desc = "Go to next diagnostic"
--       keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
--
--       opts.desc = "Show documentation for what is under cursor"
--       keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
--
--       opts.desc = "Restart LSP"
--       keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
--     e ]]
--
--     -- used to enable autocompletion (assign to every lsp server config)
--     local capabilities = cmp_nvim_lsp.default_capabilities()
--
--     -- Change the Diagnostic symbols in the sign column (gutter)
--     -- (not in youtube nvim video)
--     local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
--     for type, icon in pairs(signs) do
--       local hl = "DiagnosticSign" .. type
--       vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
--     end
--
--     -- configure html server
--     lspconfig["html"].setup({
--       capabilities = capabilities,
-- --[[       on_attach = on_attach, ]]
--     })
--
--     -- configure typescript server with plugin
--     lspconfig["ts_ls"].setup({
--       capabilities = capabilities
-- --[[       on_attach = on_attach ]],
--     })
--
--     -- configure css server
--     lspconfig["cssls"].setup({
--       capabilities = capabilities
-- --[[       on_attach = on_attach ]],
--     })
--
--     -- configure tailwindcss server
--     lspconfig["tailwindcss"].setup({
--       capabilities = capabilities
-- --[[       on_attach = on_attach ]],
--     })
--
--     --[[ lspconfig["prismals"].setup({
--       capabilities = capabilities,
--       on_attach = on_attach,
--     }) ]]
--
--     -- configure graphql language server
--     lspconfig["graphql"].setup({
--       capabilities = capabilities
-- --[[       on_attach = on_attach ]],
--       filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
--     })
--
--     -- configure emmet language server
--     lspconfig["emmet_ls"].setup({
--       capabilities = capabilities
-- --[[       on_attach = on_attach ]],
--       filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
--     })
--
--     -- configure python server
--     lspconfig["pyright"].setup({
--       capabilities = capabilities
-- --[[       on_attach = on_attach ]],
--     })
--
--     -- configure lua server (with special settings)
--     lspconfig["lua_ls"].setup({
--       capabilities = capabilities
-- --[[       on_attach = on_attach ]],
--       settings = { -- custom settings for lua
--         Lua = {
--           -- make the language server recognize "vim" global
--           diagnostics = {
--             globals = { "vim" },
--           },
--           workspace = {
--             -- make language server aware of runtime files
--             library = {
--               [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--               [vim.fn.stdpath("config") .. "/lua"] = true,
--             },
--           },
--         },
--       },
--     })
--
--     lspconfig["bashls"].setup({
--       capabilities = capabilities,
--     })
--   end,
-- }
--
--
-- --[[ return {
-- 		"neovim/nvim-lspconfig",
--     lazy = false,
-- 		opts = {
-- 			inlay_hints = { enabled = false },
-- 			---@type lspconfig.options
-- 			servers = {
-- 				html = {},
-- 				yamlls = {
-- 					settings = {
-- 						yaml = {
-- 							keyOrdering = false,
-- 						},
-- 					},
-- 				},
-- 				lua_ls = {
-- 					-- enabled = false,
-- 					single_file_support = true,
-- 					settings = {
-- 						Lua = {
-- 							workspace = {
-- 								checkThirdParty = false,
-- 							},
-- 							completion = {
-- 								workspaceWord = true,
-- 								callSnippet = "Both",
-- 							},
-- 							misc = {
-- 								parameters = {
-- 									-- "--log-level=trace",
-- 								},
-- 							},
-- 							hint = {
-- 								enable = true,
-- 								setType = false,
-- 								paramType = true,
-- 								paramName = "Disable",
-- 								semicolon = "Disable",
-- 								arrayIndex = "Disable",
-- 							},
-- 							doc = {
-- 								privateName = { "^_" },
-- 							},
-- 							type = {
-- 								castNumberToInteger = true,
-- 							},
-- 							diagnostics = {
-- 								disable = { "incomplete-signature-doc", "trailing-space" },
-- 								-- enable = false,
-- 								groupSeverity = {
-- 									strong = "Warning",
-- 									strict = "Warning",
-- 								},
-- 								groupFileStatus = {
-- 									["ambiguity"] = "Opened",
-- 									["await"] = "Opened",
-- 									["codestyle"] = "None",
-- 									["duplicate"] = "Opened",
-- 									["global"] = "Opened",
-- 									["luadoc"] = "Opened",
-- 									["redefined"] = "Opened",
-- 									["strict"] = "Opened",
-- 									["strong"] = "Opened",
-- 									["type-check"] = "Opened",
-- 									["unbalanced"] = "Opened",
-- 									["unused"] = "Opened",
-- 								},
-- 								unusedLocalExclude = { "_*" },
-- 							},
-- 							format = {
-- 								enable = false,
-- 								defaultConfig = {
-- 									indent_style = "space",
-- 									indent_size = "2",
-- 									continuation_indent_size = "2",
-- 								},
-- 							},
-- 						},
-- 					},
-- 				},
-- 			},
-- 			setup = {},
-- 		},
-- 	} ]]

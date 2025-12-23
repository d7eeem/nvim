return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_nvim_lsp.default_capabilities()

        local original_virtual_text = {
            spacing = 10,
            prefix = "●",
        }

        vim.diagnostic.config({
            virtual_text = original_virtual_text,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "🛇",
                    [vim.diagnostic.severity.WARN] = "⚠",
                    [vim.diagnostic.severity.HINT] = "󰠠",
                    [vim.diagnostic.severity.INFO] = "🛈",
                },
            },
            underline = false,
            update_in_insert = false,
            severity_sort = true,
        })

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

        vim.keymap.set("n", "<leader>lv", toggle_virtual_text, { desc = "Toggle virtual text" })

        local servers = {
            html = {},
            ts_ls = {},
            cssls = {
                filetypes = { "css", "scss", "rasi" },
            },
            yamlls = {
                filetypes = { "yaml", "yml" },
                settings = {
                    yaml = {
                        keyOrdering = false,
                        format = { enable = true },
                        validate = true,
                        schemaStore = {
                            enable = true,
                            url = "https://www.schemastore.org/api/json/catalog.json",
                        },
                    },
                },
            },
            tailwindcss = {},
            graphql = {
                filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
            },
            emmet_ls = {
                filetypes = {
                    "html",
                    "typescriptreact",
                    "javascriptreact",
                    "css",
                    "sass",
                    "scss",
                    "less",
                    "svelte",
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
            taplo = {
                filetypes = { "toml" },
            },
            bashls = {
                filetypes = { "bash", "sh" },
            },
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                            checkThirdParty = false,
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            },
        }

        for server, config in pairs(servers) do
            config.capabilities = capabilities
            vim.lsp.config[server] = config
            vim.lsp.enable(server)
        end
    end,
}

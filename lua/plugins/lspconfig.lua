return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", ":Mason<cr>", desc = "Mason" } },
		build = ":MasonUpdate",
		opts = {
			ensure_installed = {
				"bicep-lsp",
				"docker-compose-language-service",
				"dockerfile-language-server",
				"goimports-reviser",
				"golines",
				"gopls",
				"html-lsp",
				"json-lsp",
				"lua-language-server",
				"prettier",
				"stylua",
				"yaml-language-server",
				"lemminx",
				"shfmt",
				"beautysh",
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
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},
}, {
	"neovim/nvim-lspconfig",
	opts = {
		inlay_hints = { enabled = true },
		capabilities = {
			workspace = {
				didChangeWatchedFiles = {
					dynamicRegistration = false,
				},
			},
		},
		---@type lspconfig.options
		servers = {
			ansiblels = {},
			bashls = {},
			clangd = {},
			cssls = {},
			dockerls = {},
			tailwindcss = {
				root_dir = function(...)
					return require("lspconfig.util").root_pattern(".git")(...)
				end,
			},
			tsserver = {
				single_file_support = false,
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "literal",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = false,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
				},
			},
			html = {},
			marksman = {},
			yamlls = {
				settings = {
					yaml = {
						keyOrdering = false,
					},
				},
			},
			lua_ls = {
				single_file_support = true,
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = false,
						},
						completion = {
							workspaceWord = true,
							callSnippet = "Both",
						},
						misc = {
							parameters = {
								-- "--log-level=trace",
							},
						},
						hover = { expandAlias = false },
						hint = {
							enable = true,
							setType = false,
							paramType = true,
							paramName = "Disable",
							semicolon = "Disable",
							arrayIndex = "Disable",
						},
						doc = {
							privateName = { "^_" },
						},
						type = {
							castNumberToInteger = true,
						},
						diagnostics = {
							disable = { "incomplete-signature-doc", "trailing-space" },
							-- enable = false,
							groupSeverity = {
								strong = "Warning",
								strict = "Warning",
							},
							groupFileStatus = {
								["ambiguity"] = "Opened",
								["await"] = "Opened",
								["codestyle"] = "None",
								["duplicate"] = "Opened",
								["global"] = "Opened",
								["luadoc"] = "Opened",
								["redefined"] = "Opened",
								["strict"] = "Opened",
								["strong"] = "Opened",
								["type-check"] = "Opened",
								["unbalanced"] = "Opened",
								["unused"] = "Opened",
							},
							unusedLocalExclude = { "_*" },
						},
						format = {
							enable = true,
							defaultConfig = {
								indent_style = "space",
								indent_size = "2",
								continuation_indent_size = "2",
							},
						},
					},
				},
			},
			vimls = {},
		},
		setup = {},
	},
}, {
	"neovim/nvim-lspconfig",
	opts = {
		diagnostics = { virtual_text = { prefix = "icons" } },
	},
}, {
	"stevearc/conform.nvim",
	optional = true,
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
}, {
	"mfussenegger/nvim-lint",
	opts = {
		linters_by_ft = {
			lua = { "selene", "luacheck" },
			markdown = { "markdownlint" },
		},
		linters = {
			selene = {
				condition = function(ctx)
					return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })
				end,
			},
			luacheck = {
				condition = function(ctx)
					return vim.fs.find({ ".luacheckrc" }, { path = ctx.filename, upward = true })
				end,
			},
		},
	},
}

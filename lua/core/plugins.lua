local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return require("packer").startup({
	function()
		-- Packer can manage itself
		use("wbthomason/packer.nvim")
		--
		use({
			"prettier/vim-prettier",
			ft = { "html", "javascript", "typescript" },
			run = "yarn install",
		})
    use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
})
		use({ "mattn/emmet-vim" })

		-- look and feel
		use({
			"norcalli/nvim-colorizer.lua",
		})
		-- Themes
		use({
			"folke/tokyonight.nvim",
		})
		use({
			"eddyekofo94/gruvbox-flat.nvim",
      "morhetz/gruvbox",
      "ellisonleao/gruvbox.nvim",
      "navarasu/onedark.nvim",
      "projekt0n/github-nvim-theme",
		})
    use({ "dracula/vim", as = "dracula" })
    use { "arturgoms/moonbow.nvim" }

		use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
		use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
		use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
		use("kyazdani42/nvim-web-devicons")
		use("kyazdani42/nvim-tree.lua")
		use{'akinsho/bufferline.nvim', tag = "*"}
		use("moll/vim-bbye")
		use("nvim-lualine/lualine.nvim")
    use{"akinsho/toggleterm.nvim"}
		use("ahmedkhalf/project.nvim")
		use("lewis6991/impatient.nvim")
		use("lukas-reineke/indent-blankline.nvim")
		use("goolord/alpha-nvim")
		use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc hghlight
		use("folke/which-key.nvim")
    -- use("xiyaowong/nvim-transparent")

		-- cmp plugins
		use("hrsh7th/nvim-cmp") -- The completion plugin
		use("hrsh7th/cmp-buffer") -- buffer completions
		use("hrsh7th/cmp-path") -- path completions
		use("hrsh7th/cmp-cmdline") -- cmdline completions
		use("saadparwaiz1/cmp_luasnip") -- snippet completions
		use("hrsh7th/cmp-nvim-lsp")

		-- snippets
		use("L3MON4D3/LuaSnip") --snippet engine
		use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

		-- LSP
		use("neovim/nvim-lspconfig") -- enable LSP
    use { "williamboman/mason.nvim"} -- simple to use language server installer
    use { "williamboman/mason-lspconfig.nvim"}
		use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
		use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

		-- Telescope
		use("nvim-telescope/telescope.nvim")

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})
		use("JoosepAlviste/nvim-ts-context-commentstring")

		-- Git
		use "lewis6991/gitsigns.nvim"

		-- comments
		use({
			"terrortylor/nvim-comment",
			cmd = "CommentToggle",
			config = function()
				require("nvim_comment").setup()
			end,
		})
		-- gitlinker
		use({
			"ruifm/gitlinker.nvim",
		})

    -- Sanegx
    use({
      "felipec/vim-sanegx"
    })

    --- my plugins
    use 'd7eeem/vim-browser-search'

		---- This is for packer DO NOT TOUCH ----
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})

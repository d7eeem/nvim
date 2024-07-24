return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup({
      icons = {
        rules = false,
      },
    })
    wk.add({
      {
        mode = { "n", "v" },
        { "<leader>x",  group = "diagnostics/quickfix" },
        { "<leader>f",  group = "file" },        -- group
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
        { "<leader>fn", desc = "New File" },
        { "<leader>f1", hidden = true },                             -- hide this keymap
        { "<leader>w",  proxy = "<c-w>",                 group = "windows" }, -- proxy to window mappings
        {
          "<leader>b",
          group = "buffers",
          expand = function()
            return require("which-key.extras").expand.buf()
          end
        },
        { "<leader>g",  group = "git" },
        { "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>",                 desc = "Lazygit",     mode = "n" },
        { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>",    desc = "Next Hunk" },
        { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",    desc = "Prev Hunk" },
        { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>",   desc = "Blame" },
        { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
        { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",   desc = "Reset Hunk" },
        { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
        { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",   desc = "Stage Hunk" },
        { "<leader>gu",
          "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
          "Undo Stage Hunk",
        },
        { "<leader>go", "<cmd>Telescope git_status<cr>",                    desc = "Open changed file" },
        { "<leader>gb", "<cmd>Telescope git_branches<cr>",                  desc = "Checkout branch" },
        { "<leader>gh", "<cmd>Telescope git_commits<cr>",                   desc = "Checkout commit" },
        { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>",                  desc = "Diff", },
        { "<leader>l",  group = "LSP" },
        { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",           desc = "Code Action" },
        { "<leader>ld", "<cmd>Telescope diagnostics<cr>",                   desc = "Document Diagnostics" },
        { "<leader>lw", "<cmd>Telescope diagnostics<cr>",                   desc = "Workspace Diagnostics" },
        { "<leader>lf", "<cmd>lua vim.lsp.buf.format{async=true}<cr>",      desc = "Format" },
        { "<leader>li", "<cmd>LspInfo<cr>",                                 desc = "Info" },
        { "<leader>lI", "<cmd>LspInstallInfo<cr>",                          desc = "Installer Info" },
        { "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",      desc = "Next Diagnostic", },
        { "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",      desc = "Prev Diagnostic", },
        { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>",              desc = "CodeLens Action" },
        { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>",         desc = "Quickfix" },
        { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",                desc = "Rename" },
        { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>",          desc = "Document Symbols" },
        { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols", },
        { "<leader>s", group = "Telescope_Search" },
        { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
        { "<leader>sc", "<cmd>Telescope colorscheme<cr>",  desc = "Colorscheme" },
        { "<leader>sh", "<cmd>Telescope help_tags<cr>",    desc = "Find Help" },
        { "<leader>sM", "<cmd>Telescope man_pages<cr>",    desc = "Man Pages" },
        { "<leader>sr", "<cmd>Telescope oldfiles<cr>",     desc = "Open Recent File" },
        { "<leader>sR", "<cmd>Telescope registers<cr>",    desc = "Registers" },
        { "<leader>sk", "<cmd>Telescope keymaps<cr>",      desc = "Keymaps" },
        { "<leader>sC", "<cmd>Telescope commands<cr>",     desc = "Commands" },
      } })
  end,
}
--[[ return {
      n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
      u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
      t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
      p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
      f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
      h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
      v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    }
}},
config = function(_, opts)
    local wk = require("which-key")
    wk.setup(setup)
    wk.register(opts.defaults)
end,
} ]]

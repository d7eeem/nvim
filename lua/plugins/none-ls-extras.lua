return {
  "nvimtools/none-ls-extras.nvim",
  lazy = false,
  config = function()
  require("none-ls.code_actions.eslint")
  require("none-ls.diagnostics.eslint")
  end
}
  

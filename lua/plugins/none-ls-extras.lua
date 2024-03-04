return {
  "nvimtools/none-ls-extras.nvim",
  lazy = false,
  config = function()
  require("none-ls.code_actions.eslint")
  require("none-ls.diagnostics.eslint")
  require("none-ls.formatting.eslint")
  require("none-ls.formatting.beautysh")
  require("none-ls.diagnostics.yamllint")
  require("none-ls.formatting.jq")
  require("none-ls.formatting.yq")
  end
}
  

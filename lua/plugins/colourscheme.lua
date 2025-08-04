-- Set transparency
local is_transparent = true -- Set to false to disable transparency in 🪟
if vim.fn.has("unix") == 1 then
  is_transparent = true
end

if is_transparent then
  vim.opt.fillchars:append({
    horiz = " ",
    horizup = " ",
    horizdown = " ",
    vert = " ",
    vertleft = " ",
    vertright = " ",
    verthoriz = " ",
    eob = " ",
  })
end
local M = {
  "neanias/everforest-nvim",
  lazy = false,
  priority = 1000,   -- make sure to load this before all the other start plugins
}

function M.config()
  local everforest = require("everforest")
  everforest.setup({
    background = "hard",
    transparent_background_level = 0,
    italics = true,
    disable_italic_comments = false,
    inlay_hints_background = "dimmed",
    on_highlights = function(hl, _)
      hl["@string.special.symbol.ruby"] = {link = "@field"}
    end,
  })
  everforest.load()
end

return M

-- return {
--   'uZer/pywal16.nvim',
--   name = "pywal16",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("pywal16").setup()
--   end,
-- }
-- return {
--   'uZer/pywal16.nvim',
--   name = "pywal16",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd("pywal16")
--   end,
-- }
-- return {
--   {
--     "arturgoms/moonbow.nvim",
--     name = "moonbow",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       vim.cmd("colorscheme moonbow")
--     end,
--   },
-- }

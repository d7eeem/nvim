return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>bp", ":BufferLineTogglePin<CR>",            desc = "Toggle pin" },
    { "<leader>bP", ":BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
  },
  opts = {
    options = {
      numbers = "none",               -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
      close_command = "bd! %d",       -- Fixed: use built-in buffer delete
      right_mouse_command = "bd! %d", -- Fixed: use built-in buffer delete
      left_mouse_command = "buffer %d",
      middle_mouse_command = nil,
      indicator_icon = nil,
      indicator = { style = "icon", icon = "▎" },
      buffer_close_icon = "",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 30,
      max_prefix_length = 30,
      tab_size = 21,
      diagnostics = "nvim_lsp", -- or "coc"
      diagnostics_update_in_insert = false,
      offsets = {
        { filetype = "NvimTree", text = "", padding = 1 },
      },
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      separator_style = "thin", -- "thick" | "thin" | { 'any', 'any' }
      enforce_regular_tabs = true,
      always_show_bufferline = true,
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,
    },
  },
}

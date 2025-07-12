return {
  "catgoose/nvim-colorizer.lua",
  lazy = false,
  config = function()
    require("colorizer").setup({
      filetypes = { "*" },
      buftypes = {},
      user_commands = true,
      lazy_load = true,

      user_default_options = {
        names              = true,
        names_opts         = {
          lowercase = true,
          camelcase = true,
          uppercase = false,
          strip_digits = false,
        },
        names_custom       = {},

        RGB                = true, -- #RGB
        RGBA               = true, -- #RGBA
        RRGGBB             = true, -- #RRGGBB
        RRGGBBAA           = true, -- #RRGGBBAA
        AARRGGBB           = true, -- 0xAARRGGBB
        rgb_fn             = true, -- rgb() and rgba()
        hsl_fn             = true, -- hsl() and hsla()
        css                = true, -- Enable CSS keywords and named colors
        css_fn             = true, -- Enable all CSS color functions
        tailwind           = true,
        tailwind_opts      = {
          update_names = false,
        },
        sass               = {
          enable = true,
          parsers = { "css" },
        },

        -- Display mode
        mode               = "virtualtext", -- Use virtual text for color preview
        virtualtext        = "󱓻", -- Symbol to show
        virtualtext_inline = "before", -- Show within the line
        virtualtext_mode   = "foreground",

        always_update      = true, -- Always reapply highlighting
        hooks              = {
          disable_line_highlight = false,
        },
      },
    })
  end,
}

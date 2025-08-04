return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
      {
        "<leader>n",
        function()
          require("neo-tree.command").execute({toggle = true, dir = vim.fn.getcwd()})
        end,
        desc = "Explorer NeoTree",
      },
      {
        "<leader>ge",
        function()
          require("neo-tree.command").execute({source = "git_status", toggle = true})
        end,
        desc = "Git Explorer",
      },
      {
        "<leader>be",
        function()
          require("neo-tree.command").execute({source = "buffers", toggle = true})
        end,
        desc = "Buffer Explorer",
      },
    },
    opts = {
      sources = {"filesystem", "buffers", "git_status"},
      open_files_do_not_replace_types = {"terminal", "Trouble", "trouble", "qf", "Outline"},
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = {enabled = true},
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      window = {
        position = "left",
        width = 25,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
          ["<space>"] = "none",
          ["Y"] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg("+", path, "c")
            end,
            desc = "Copy Path to Clipboard",
          },
          ["O"] = {
            function(state)
              local node = state.tree:get_node()
              if node and node.path then
                vim.fn.system("xdg-open " .. vim.fn.shellescape(node.path))
              end
            end,
            desc = "Open with System Application",
          },
          ["p"] = {"toggle_preview", config = {use_float = false}},
          ["<2-LeftMouse>"] = "open",
          ["<cr>"] = "open",
          ["<esc>"] = "cancel",
          ["s"] = "open_split",
          ["v"] = "open_vsplit",
          ["a"] = {
            "add",
            -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
            -- some commands may take optional config options, see `:h neo-tree-mappings` for details
            config = {
              show_path = "none",               -- "none", "relative", "absolute"
            },
          },
          ["A"] = "add_directory",           -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
          ["d"] = "delete",
          ["r"] = "rename",
          ["b"] = "rename_basename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["P"] = "paste_from_clipboard",
          ["c"] = "copy",
          ["m"] = "move",           -- takes text input for destination, also accepts the optional config.show_path option like "add".
          ["q"] = "close_window",
          ["R"] = "refresh",
          ["?"] = "show_help",
          ["<"] = "prev_source",
          [">"] = "next_source",
          ["i"] = "show_file_details",
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        git_status = {
          symbols = {
            added = "✚",
            modified = "",
            deleted = "✖",
            renamed = "󰁕",
            untracked = "",
            ignored = "",
            unstaged = "󰄱 ",
            staged = "",
            conflict = "",
          },
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "󰜌",
          provider = function(icon, node, state)
            if node.type == "file" or node.type == "terminal" then
              local success, web_devicons = pcall(require, "nvim-web-devicons")
              local name = node.type == "terminal" and "terminal" or node.name
              if success then
                local devicon, hl = web_devicons.get_icon(name)
                icon.text = devicon or icon.text
                icon.highlight = hl or icon.highlight
              end
            end
          end,
          default = "*",
          highlight = "NeoTreeFileIcon",
        },
      },
    },
    config = function(_, opts)
      require("neo-tree").setup(opts)
    end,
  },
}

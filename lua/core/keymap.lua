local opt = {}
local opts = { noremap = true, silent = true }
local km = vim.api.nvim_set_keymap

-- Mapping leader
vim.g.mapleader = ","
vim.g.maplocalleader = ","


-- lsp remapping
-- km("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)


-- To Fix my fat fingers mistakes
km("c", "WQ", "wq", opt)
km("c", "Wq", "wq", opt)
km("c", "Q", "q", opt)
km("c", "q1", "q!", opt)
km("c", "w!", "w !sudo tee %", opt)

-- spell-check set to <leader>o, 'o' for 'orthography'
km("n", "<leader>o", ":setlocal spell! spelllang=en_us<CR>", opt)

-- Nerd Tree
km("n", "<leader>n", ":NvimTreeToggle<CR>", opt)
--
-- Shortcutting split navigation, saving a keypress:
km("n", "<C-h>", "<C-w>h", opt)
km("n", "<C-j>", "<C-w>j", opt)
km("n", "<C-k>", "<C-w>k", opt)
km("n", "<C-l>", "<C-w>l", opt)

-- best remap ever globle sed replace
km("n", "S", ":%s//g<Left><Left>", opt) -- this remap do sed replace function

-- Commenter Keybinding
km("n", "<leader>/", ":CommentToggle<CR>", opt)
km("v", "<leader>/", ":CommentToggle<CR>", opt)

-- bufferline tab stuff
km("n", "T", ":tabnew<CR>", opt) -- new tab
km("n", "X", ":bd!<CR>", opt) -- close tab

-- move between tabs
km("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
km("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)

-- better window controls
km("n", "<C-Up>", ":resize +2<CR>", { silent = true })
km("n", "<C-Down>", ":resize -2<CR>", { silent = true })
km("n", "<C-Left>", ":vertical resize +2<CR>", { silent = true })
km("n", "<C-Right>", ":vertical resize -2<CR>", { silent = true })

-- better indenting
km("v", "<", "<gv", opts)
km("v", ">", ">gv", opts)

-- I hate escape

km("i", "jk", "<ESC>", opts)
km("i", "kj", "<ESC>", opts)
km("i", "jj", "<ESC>", opts)
km("i", "kk", "<ESC>", opts)

-- Move selected line / block of text in visual mode
km("x", "K", ":move '<-2<CR>gv-gv", opts)
km("x", "J", ":move '>+1<CR>gv-gv", opts)


local opt = {}
local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- Mapping leader
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- lsp remapping
-- map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)

-- To Fix my fat fingers mistakes
map("c", "WQ", "wq", opt)
map("c", "Wq", "wq", opt)
map("c", "Q", "q", opt)
map("c", "q1", "q!", opt)
map("c", "w!", "w !sudo tee %", opt)

-- spell-check set to <leader>o, 'o' for 'orthography'
map("n", "<leader>o", ":setlocal spell! spelllang=en_us<CR>", opt)

-- Nerd Tree
map("n", "<leader>n", ":NvimTreeToggle<CR>", opt)
--
-- Shortcutting split navigation, saving a keypress:
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)

-- best remap ever globle sed replace
map("n", "S", ":%s//g<Left><Left>", opt) -- this remap do sed replace function

-- Commenter Keybinding
map("n", "<leader>/", ":CommentToggle<CR>", opt)
map("v", "<leader>/", ":CommentToggle<CR>", opt)

-- bufferline tab stuff
map("n", "T", ":tabnew<CR>", opt) -- new tab
map("n", "X", ":bd!<CR>", opt) -- close tab

-- move between tabs
map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)

-- better window controls
map("n", "<C-Up>", ":resize +2<CR>", { silent = true })
map("n", "<C-Down>", ":resize -2<CR>", { silent = true })
map("n", "<C-Left>", ":vertical resize +2<CR>", { silent = true })
map("n", "<C-Right>", ":vertical resize -2<CR>", { silent = true })

-- better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- I hate escape

map("i", "jk", "<ESC>", opts)
map("i", "kj", "<ESC>", opts)
map("i", "jj", "<ESC>", opts)
map("i", "kk", "<ESC>", opts)

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "J", ":move '>+1<CR>gv-gv", opts)

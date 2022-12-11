-- Base opts
local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Write buffer
keymap("n", "<C-s>", ":w<CR>", opts)

-- Closes the current buffer
keymap("n", "<leader>w", ":bd<CR>", opts)
keymap("n", "<leader>W", ":bd!<CR>", opts)

-- Closes the current window
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>Q", ":q!<CR>", opts)

-- Jump lines
keymap("n", "<C-Up>", ":-5<CR>", opts)
keymap("n", "<C-Down>", ":+5<CR>", opts)

-- Toggle NvimTree
keymap("n", "<leader>t", ":NvimTreeToggle<CR>", opts)

-- Telescope mappings
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Splits navigation
keymap("n", "vs", ":vs<CR>", opts)
keymap("n", "hs", ":sp<CR>", opts)

-- Navigate between splits
keymap("n", "<A-Left>", "<C-w>h", opts)
keymap("n", "<A-Right>", "<C-w>l", opts)
keymap("n", "<A-Up>", "<C-w>k", opts)
keymap("n", "<A-Down>", "<C-w>j", opts)

-- Correct the clipboard
keymap("i", "<C-c>", "<C-r>0", opts)
keymap("i", "<C-v>", "<C-r>+", opts)

-- Repeat last command
keymap("n", ".", "@:", opts)

-- Search
keymap("n", "<C-f>", ":%s/", opts)

-- Terminal
keymap("n", "T", ":sp<CR> :term<CR> :resize 20N<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-Down>", ":m .+1<CR>==", opts)
keymap("v", "<A-Up>", ":m .-2<CR>==", opts)

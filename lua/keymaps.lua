local opts = {
    noremap = true,
    silent = true
 }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Write buffer
keymap("n", "<C-s>", ":w<CR>", opts)

-- Closes the current buffer
keymap("n", "<C-w>", ":bd<CR>", opts)
-- Closes the current window
keymap("n", "<C-S-w>", ":q<CR>", opts)

-- Jump lines
keymap("n", "<C-Up>", ":-5<CR>", opts)
keymap("n", "<C-Down>", ":+5<CR>", opts)

-- Telescope mappings
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Splits navigation
keymap("n", "vs", ":vs<CR>", opts)
keymap("n", "sp", ":sp<CR>", opts)

-- Correct the clipboard
keymap("i", "<C-v>", "<C-r>+", opts)
keymap("i", "<C-c>", "<C-r>0", opts)

-- Repeat last command
keymap("n", "<leader>.", "@:", opts)

-- Search
keymap("n", "<C-f>", ":%s/", opts)

-- Terminal
keymap("n", "<leader>t", ":sp<CR> :term<CR> :resize 20N<CR> i", opts)

-- Quick.nvim
keymap("n", "tn", ":tabnew<CR>", opts)
keymap("n", "tk", ":tabnext<CR>", opts)
keymap("n", "tj", ":tabprev<CR>", opts)
keymap("n", "to", ":tabo<CR>", opts)
keymap("t", "<Esc>", "<C-\\><C-n>", opts)
keymap("n", "<C-N>", ":Lexplore<CR> :vertical resize 30<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-Up>", ":m .+1<CR>==", opts)
keymap("v", "<A-Down>", ":m .-2<CR>==", opts)
keymap("v", "p", "\"_dP", opts)

-- Move text up and down
keymap("x", "Up", ":move '>+1<CR>gv-gv", opts)
keymap("x", "Down", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-Up>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-Down>", ":move '<-2<CR>gv-gv", opts)

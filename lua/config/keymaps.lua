-- Base opts
local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

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
keymap("n", "<leader>tt", ":NvimTreeToggle<CR>", opts)

-- Telescope mappings
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-----------------------------------------------------------

-- vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
-- vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
-- vim.keymap.set("n", "<leader>/", function()
--   -- You can pass additional configuration to telescope to change theme, layout, etc.
--   require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
--     winblend = 10,
--     previewer = false,
--   })
-- end, { desc = "[/] Fuzzily search in current buffer]" })
--
-- vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
-- vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
-- vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
-- vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
-- vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

-----------------------------------------------------------

-- Splits navigation
keymap("n", "<leader>sv", ":vs<CR>", opts)
keymap("n", "<leader>sh", ":sp<CR>", opts)

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
keymap("n", "<leader>sf", ":%s/", opts)

-- Terminal
keymap("n", "T", ":sp<CR> :term<CR> :resize 20N<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-Down>", ":m .+1<CR>==", opts)
keymap("v", "<A-Up>", ":m .-2<CR>==", opts)
keymap("n", "<A-Down>", ":m .+1<CR>==", opts)
keymap("n", "<A-Up>", ":m .-2<CR>==", opts)

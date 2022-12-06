local actions = require("telescope.actions")
local lactions = require("telescope.actions.layout")
local finders = require("telescope.builtin")

-- Schedule the neoclip extencion to be loaded after telescope
vim.schedule(function() require("telescope").load_extension("neoclip") end)

require("telescope").setup({
    defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "   ",
        initial_mode = "insert",
        sorting_strategy = "ascending",
        mappings = {
            i = {
                ["<ESC>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<TAB>"] = actions.toggle_selection + actions.move_selection_next,
                ["<C-s>"] = actions.send_selected_to_qflist,
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-h>"] = lactions.toggle_preview
             }
         }
     }
 })

local Telescope = setmetatable({}, {
    __index = function(_, k)
        if vim.bo.filetype == "NvimTree" then
            vim.cmd.wincmd("l")
        end
        return finders[k]
    end
 })

-- Ctrl-p = fuzzy finder
vim.keymap.set("n", "<C-P>", function()
    local ok = pcall(Telescope.git_files, {
        show_untracked = true
     })
    if not ok then
        Telescope.find_files()
    end
end)

-- Get :help at the speed of light
vim.keymap.set("n", "<leader>H", Telescope.help_tags)

vim.api.nvim_set_keymap("n", "<C-P>", "<cmd>lua require('telescope.builtin').find_files()<CR>", {
    noremap = true
 })
vim.api.nvim_set_keymap("n", "<C-F>", "<cmd>lua require('telescope.builtin').live_grep()<CR>", {
    noremap = true
 })
vim.api.nvim_set_keymap("n", "<C-B>", "<cmd>lua require('telescope.builtin').buffers()<CR>", {
    noremap = true
 })

local actions = require("telescope.actions")
local lactions = require("telescope.actions.layout")
local finders = require("telescope.builtin")

-- Schedule the neoclip extencion to be loaded after telescope
vim.schedule(function() require("telescope").load_extension("neoclip") end)

require("telescope").setup({
    defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "   ",
        initial_mode = "insert",
        sorting_strategy = "ascending"
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

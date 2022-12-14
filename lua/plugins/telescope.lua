local telescope = require "telescope"

-- Schedule the neoclip extencion to be loaded after telescope
vim.schedule(function()
  require("telescope").load_extension "neoclip"
end)

require("telescope").setup {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "   ",
    initial_mode = "insert",
    sorting_strategy = "ascending",
  },
  pickers = {
    find_files = {
      theme = "ivy",
    },
  },
}

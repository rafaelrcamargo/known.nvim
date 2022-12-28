local telescope = require "telescope"

return function()
  vim.schedule(function() telescope.load_extension "neoclip" end)
  return telescope.setup {
    defaults = {
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "   ",
      initial_mode = "insert",
      sorting_strategy = "ascending",
      layout_strategy = "vertical",
      layout_config = {
        height = 10, -- maximally available lines
      },
    },
    pickers = {
      find_files = { theme = "ivy" },
      buffers = { theme = "ivy" },
      live_grep = { theme = "ivy" },
    },
  }
end

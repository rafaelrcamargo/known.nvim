local telescope = require "telescope"

local theme = {
  theme = "ivy",
  layout_config = {
    height = vim.o.lines / 2,
    width = vim.o.columns,
  },
}

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
        height = vim.o.lines / 2, -- maximally available lines
        width = vim.o.columns, -- maximally available columns
      },
    },
    pickers = {
      find_files = theme,
      live_grep = theme,
      buffers = theme,
      oldfiles = theme,
      current_buffer_fuzzy_find = theme,
      help_tags = theme,
    },
  }
end

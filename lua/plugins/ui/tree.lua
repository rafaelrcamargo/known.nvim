require("nvim-tree").setup {
  disable_netrw = true,
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  renderer = {
    icons = {
      show = {
        git = false,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
      },
    },
  },
}

local api = require "nvim-tree.api"
api.events.subscribe(api.events.Event.FileCreated, function(file) vim.cmd("edit " .. file.fname) end)

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then vim.cmd "quit" end
  end,
})

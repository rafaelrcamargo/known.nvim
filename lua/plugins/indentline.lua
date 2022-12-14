require("indent_blankline").setup {
  show_trailing_blankline_indent = false,
  use_treesitter = true,
  show_current_context = true,
  buftype_exclude = { "terminal", "nofile" },
  filetype_exclude = { "help", "packer", "dashboard" },
}

vim.cmd [[highlight IndentBlanklineIndent1 guibg=#847567 gui=nocombine]]

require("indent_blankline").setup {
  use_treesitter = true,
  show_trailing_blankline_indent = false,
  buftype_exclude = { "terminal", "nofile" },
  filetype_exclude = { "help", "packer", "dashboard" },
}

vim.cmd([[
  augroup user_colors
    autocmd!
    autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
  augroup END
]])

vim.g.gruvbox_material_background = 'soft'
vim.g.gruvbox_material_better_performance = 1
vim.cmd('colorscheme gruvbox-material')
vim.o.background = 'dark'

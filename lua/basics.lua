-- Configure python providers
vim.g.python_host_prog = "/usr/bin/python2"
vim.g.python3_host_prog = "/usr/bin/python3"

-- Testing to see the behavior
vim.opt.shadafile = "NONE"
vim.opt.shadafile = ""

-- Testing to see the behavior
vim.opt.lazyredraw = true -- Unstable

vim.o.backup = false -- This is recommended by coc
vim.o.clipboard = "" -- Copy paste between vim and everything else
vim.o.cmdheight = 1 -- Space for displaying messages
vim.o.conceallevel = 0 -- so that `` is visible in markdown files
vim.o.cursorline = true -- Highlight current line
vim.o.errorbells = false -- Disable error bells
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.hlsearch = false -- Disable highlighting search results
vim.o.ignorecase = true -- Ignore case when using lowercase in search
vim.o.incsearch = true -- Show search results as you type
vim.o.mouse = "a" -- Enable mouse support
vim.o.number = true -- Show line numbers
vim.o.numberwidth = 4 -- Set line number width
vim.o.relativenumber = true -- Show relative line numbers
vim.o.scrolloff = 8 -- Minimum offset in lines to screen borders
vim.o.shiftwidth = 2 -- Number of spaces to use for autoindent
vim.o.sidescrolloff = 8 -- Minimum offset in columns to screen borders
vim.o.signcolumn = "yes" -- Always show the sign column, otherwise it would shift the text each time
vim.o.smartcase = true -- But don't ignore it when using upper case
vim.o.smartindent = true -- But don't ignore it when using upper case
vim.o.splitbelow = true -- Put new windows below current
vim.o.splitright = true -- Put new windows right of current
vim.o.swapfile = false -- Disable swap files
vim.o.tabstop = 2 -- Number of spaces tabs count for
vim.o.termguicolors = true -- Use true colors, required for some plugins
vim.o.undofile = true -- Enable persistent undo
vim.o.updatetime = 300 -- Faster completion (4000ms default)
vim.o.wrap = false -- Disable line wrapping
vim.o.writebackup = false -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

vim.cmd([[
  set breakindent
  set breakindentopt=shift:2,min:40,sbr

  if exists("g:neovide")
    let g:neovide_transparency = 1
    let g:neovide_scroll_animation_length = 0.2
    let g:neovide_cursor_unfocused_outline_width = 0.1
  endif
]])

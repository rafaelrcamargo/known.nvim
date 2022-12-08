-- Configure python providers
vim.g.python_host_prog = "/usr/bin/python2"
vim.g.python3_host_prog = "/usr/bin/python3"

-- Testing to see the behavior
vim.opt.shadafile = "NONE"
vim.opt.shadafile = ""

-- Testing to see the behavior
vim.opt.lazyredraw = true -- Unstable

vim.opt.backup = false -- This is recommended by coc
vim.opt.clipboard = "unnamedplus" -- System clipboard integration
-- vim.opt.clipboard = "" -- Disbling this for now, it's causing issues with the WSL
vim.opt.cmdheight = 1 -- Space for displaying messages
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.cursorline = true -- Highlight current line
vim.opt.errorbells = false -- Disable error bells
vim.opt.hlsearch = false -- Disable highlighting search results
vim.opt.ignorecase = true -- Ignore case when using lowercase in search
vim.opt.incsearch = true -- Show search results as you type
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.number = true -- Show line numbers
vim.opt.numberwidth = 2 -- Set line number width
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.scrolloff = 8 -- Minimum offset in lines to screen borders
vim.opt.sidescrolloff = 8 -- Minimum offset in columns to screen borders
vim.opt.signcolumn = "yes" -- Always show the sign column, otherwise it would shift the text each time
vim.opt.smartcase = true -- But don't ignore it when using upper case
vim.opt.smartindent = true -- But don't ignore it when using upper case
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.swapfile = false -- Disable swap files
vim.opt.termguicolors = true -- Use true colors, required for some plugins
vim.opt.undofile = true -- Enable persistent undo
vim.opt.updatetime = 300 -- Faster completion (4000ms default)
vim.opt.wrap = false -- Disable line wrapping
vim.opt.writebackup = false -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- I want 2 spaces, pls...
vim.opt.autoindent = true -- Copy indent from current line when starting a new line
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.softtabstop = 2 -- Number of spaces that a <Tab> counts for while performing editing operations
vim.opt.tabstop = 2 -- Number of spaces tabs count for

-- Correct identation
-- vim.opt.breakindent = true
-- vim.opt.breakindentopt = "shift:2,min:40,sbr"

-- Set neovide up
if vim.g.neovide then
    vim.g.neovide_transparency = 1
    vim.g.neovide_scroll_animation_length = 0.2
    vim.g.neovide_cursor_unfocused_outline_width = 0.1
    vim.opt.guifont = "FiraCode Nerd Font"
end

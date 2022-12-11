local g, opt = vim.g, vim.opt

-- Configure python providers
g.python_host_prog = "/usr/bin/python2"
g.python3_host_prog = "/usr/bin/python3"

-- Configure shell provider
opt.shell = "/bin/bash"

-- Testing to see the behavior
opt.shadafile = "NONE"
opt.shadafile = ""

-- Testing to see the behavior
opt.lazyredraw = true -- Unstable

opt.backup = false -- This is recommended by coc
-- opt.clipboard = "unnamedplus" -- System clipboard integration
opt.clipboard = "" -- Disbling this for now, it's causing issues with the WSL
opt.cmdheight = 1 -- Space for displaying messages
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.cursorline = true -- Highlight current line
opt.errorbells = false -- Disable error bells
opt.hlsearch = false -- Disable highlighting search results
opt.ignorecase = true -- Ignore case when using lowercase in search
opt.incsearch = true -- Show search results as you type
opt.mouse = "a" -- Enable mouse support
opt.number = true -- Show line numbers
opt.numberwidth = 2 -- Set line number width
opt.relativenumber = true -- Show relative line numbers
opt.scrolloff = 8 -- Minimum offset in lines to screen borders
opt.sidescrolloff = 8 -- Minimum offset in columns to screen borders
opt.signcolumn = "yes" -- Always show the sign column, otherwise it would shift the text each time
opt.smartcase = true -- But don't ignore it when using upper case
opt.smartindent = true -- But don't ignore it when using upper case
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.swapfile = false -- Disable swap files
opt.termguicolors = true -- Use true colors, required for some plugins
opt.undofile = true -- Enable persistent undo
opt.updatetime = 300 -- Faster completion (4000ms default)
opt.wrap = false -- Disable line wrapping
opt.writebackup = false -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- I want 2 spaces, pls...
opt.autoindent = true -- Copy indent from current line when starting a new line
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 2 -- Size of an indent
opt.softtabstop = 2 -- Number of spaces that a <Tab> counts for while performing editing operations
opt.tabstop = 2 -- Number of spaces tabs count for

-- Correct identation
opt.breakindent = true
opt.breakindentopt = "shift:2,min:40,sbr"

-- Set neovide up
if g.neovide then
    g.neovide_transparency = 1
    g.neovide_scroll_animation_length = 0.2
    g.neovide_cursor_unfocused_outline_width = 0.1
    opt.guifont = "FiraCode Nerd Font"
end

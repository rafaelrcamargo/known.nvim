local g, opt = vim.g, vim.opt

-- Configure some providers
g.python_host_prog = "/usr/bin/python2"
g.python3_host_prog = "/usr/bin/python3"
opt.shell = "/bin/bash"

-- Testing some configs
opt.lazyredraw = true -- Unstable
opt.shadafile = "NONE"
opt.shadafile = ""

--------------
--- Basics ---
--------------

opt.writebackup = false
opt.backup = false
opt.swapfile = false

opt.undofile = true

-- opt.clipboard = "unnamedplus"
opt.clipboard = "" -- Disabling for now, it's WSL...

opt.cmdheight = 0
opt.cursorline = true

--------------
--- Search ---
--------------

opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

--------------
---- Misc ----
--------------

opt.mouse = "a"

opt.number = true
opt.numberwidth = 2
opt.relativenumber = true

opt.scrolloff = 8
opt.sidescrolloff = 8

opt.termguicolors = true
opt.signcolumn = "yes"
opt.updatetime = 300
opt.wrap = false

opt.splitbelow = true
opt.splitright = true

opt.smartindent = true
opt.autoindent = true
opt.expandtab = true
opt.softtabstop = 2
opt.shiftwidth = 2
opt.tabstop = 2

-- Correct identation
opt.breakindent = true
opt.breakindentopt = "shift:2,min:40,sbr"

-- Disable nvim intro
opt.shortmess:append "sI"

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- Set completeopt to have a better completion experience
opt.completeopt = "menuone,noselect"

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.highlight.on_yank() end,
  group = highlight_group,
  pattern = "*",
})

-- Set neovide config
if g.neovide then
  g.neovide_transparency = 0.2
  g.transparency = 0.2
  g.neovide_background_color = "#ffffff"
  g.neovide_scroll_animation_length = 0.2
  g.neovide_cursor_unfocused_outline_width = 0.1
  opt.guifont = "FiraCode Nerd Font"
end

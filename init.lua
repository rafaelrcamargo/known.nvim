local g, cmd = vim.g, vim.cmd

-- Requiring impatient by the safe & fast way:
local ok, _ = pcall(require, "impatient")
if not ok then print "impatient.nvim not found!" end

-- Disable some default loaded plugins
require "config.loaded"

-- Setting our leader before plugins/keymaps are loaded:
g.mapleader = " " -- Global leader
g.maplocalleader = " " -- Local leader

-- Load basic vim settings
require "config.basics"

-- Pre-load the colorscheme if possible
local ok, _ = pcall(cmd, "colorscheme catppuccin")
if not ok then cmd "silent! colorscheme slate" end

vim.schedule(function()
    -- Load keymaps
    require "config.keymaps"
end)

-- Require all the setup, so *impatient* can cache it.
require "init" -- This will be the config entry point.

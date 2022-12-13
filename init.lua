-- Requiring impatient by the safe & fast way:
local ok, _ = pcall(require, "impatient")
if not ok then print "Impatient.nvim not found! ([:PackerSync] may help!)" end

-- Load basic vim settings
require "config.basics"

-- Disable some default loaded plugins
require "config.loaded"

local g, cmd = vim.g, vim.cmd

-- Pre-load the colorscheme if possible
local catppuccin, _ = pcall(cmd, "colorscheme catppuccin")
if not catppuccin then cmd "silent! colorscheme slate" end

-- Setting our leader before plugins/keymaps are loaded:
g.mapleader = " " -- Global leader
g.maplocalleader = " " -- Local leader

-- Load keymaps
vim.schedule(function() require "config.keymaps" end)

-- Require all the setup, so *impatient* can cache it.
-- require "init" -- This will be the config entry point.

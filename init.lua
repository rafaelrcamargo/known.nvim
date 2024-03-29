-- Requiring impatient by the safe & fast way:
local ok, _ = pcall(require, "impatient")
if not ok then print "Impatient.nvim not found! (:PackerSync may help!)" end

-- Disable some default loaded plugins
require "config.loaded"

-- Load basic vim settings
require "config.basics"

local g, cmd = vim.g, vim.cmd

-- Setting our leader before plugins/keymaps are loaded:
g.mapleader = " " -- Global leader
g.maplocalleader = " " -- Local leader

-- Pre-load the colorscheme if possible
local catppuccin, _ = pcall(cmd, "colorscheme catppuccin")
if not catppuccin then cmd "silent! colorscheme slate" end

-- Load keymaps
vim.schedule(function() require "config.keymaps" end)

-- Add binaries installed by mason.nvim to path (Windows only)
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"

-- Require packer & plugins, so impatient can cache it.
require "plugins" -- This will be the config entry point.


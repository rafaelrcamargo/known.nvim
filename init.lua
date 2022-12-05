-- Requiring impatient by the safe way:
local ok, impatient = pcall(require, "impatient")
if ok then
    impatient.enable_profile()
end

-- Setting our leader before plugins/keymaps are loaded:
vim.g.mapleader = " " -- Global leader
vim.g.maplocalleader = " " -- Local leader

-- Require all the setup, so *impatient* can cache it.
require("setup") -- This will be the config entry point.

-- disable some builtin vim plugins
local Default_plugins = { "2html_plugin", "getscript", "getscriptPlugin", "gzip", "logipat", "netrw", "netrwPlugin", "netrwSettings", "netrwFileHandlers", "matchit", "tar", "tarPlugin", "rrhelper", "spellfile_plugin", "vimball", "vimballPlugin", "zip", "zipPlugin", "tutor", "rplugin", "syntax", "synmenu", "optwin", "compiler", "bugreport", "ftplugin" }

for _, plugin in pairs(default_plugins) do g["loaded_" .. plugin] = 1 end

-- Disable some builtin vim providers
local default_providers = { "node", "perl", "ruby" }
for _, provider in pairs(default_providers) do vim.g["loaded_" .. provider .. "_provider"] = 0 end

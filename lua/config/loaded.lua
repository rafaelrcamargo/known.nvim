local g = vim.g

-- Disable some builtin vim plugins
local built_ins = { "2html_plugin", "bugreport", "compiler", "ftplugin", "getscript", "getscriptPlugin", "gzip", "logipat", "matchit", "netrw", "netrwPlugin", "optwin", "rplugin", "rrhelper", "spellfile_plugin", "synmenu", "syntax", "tar", "tarPlugin", "tutor", "vimball", "vimballPlugin", "zip", "zipPlugin" }
for _, plugin in pairs(built_ins) do g["loaded_" .. plugin] = 1 end

-- Disble some default providers
g.loaded_ruby_provider = 1
g.loaded_perl_provider = 1
g.loaded_node_provider = 1

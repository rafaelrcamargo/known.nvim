-- Disable some builtin vim plugins
local built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
    "tutor",
    "rplugin",
    "syntax",
    "synmenu",
    "optwin",
    "compiler",
    "bugreport",
    "ftplugin"
 }
for _, plugin in pairs(built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- Disble some default providers
local default_providers = {
    "perl",
    "ruby"
 }
for _, provider in pairs(default_providers) do
    vim.g["loaded_" .. provider .. "_provider"] = 0
end

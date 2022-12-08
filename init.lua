-- Requiring impatient by the safe & fast way:
local ok, _ = pcall(require, "impatient")
if not ok then vim.notify("\"impatient.nvim\" not found.", vim.log.levels.WARN) end

-- Require all the setup, so *impatient* can cache it.
require("init") -- This will be the config entry point.

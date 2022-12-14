local schedule = vim.schedule
local M = {
  ["install"] = function() end,
  ["config"] = function() end,
} -- We do that so the lua compiler knows that we're going to define those functions later, not having to rehash the table each time.

-- Setup nvim-treesitter auto update:
function M.install()
  schedule(function()
    require("nvim-treesitter.install").update {
      with_sync = true,
    }()
  end)
end

local ts_configs = require "nvim-treesitter.configs"

-- Setup nvim-treesitter setup:
function M.config()
  ts_configs.setup {}
  schedule(function()
    ts_configs.setup {
      auto_install = true,
      ensure_installed = {
        "html",
        "css",
        "javascript",
        "typescript",
        "json",
        "yaml",
        "lua",
        "bash",
        "python",
        "c",
        "cpp",
        "rust",
        "go",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    }
  end)
end

return M

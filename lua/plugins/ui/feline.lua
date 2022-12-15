local palette = require "utils.palette"

local lazy_require = require("feline.utils").lazy_require
local vi_mode = lazy_require "feline.providers.vi_mode"
local api, fn, isempty, diagnostic = vim.api, vim.fn, vim.tbl_isempty, vim.diagnostic

local vi_mode_colors = {
  NORMAL = "fg",
  OP = "red",
  INSERT = "green",
  VISUAL = "blue",
  LINES = "purple",
  BLOCK = "purple",
  REPLACE = "red",
  ["V-REPLACE"] = "purple",
  ENTER = "blue",
  MORE = "blue",
  SELECT = "orange",
  COMMAND = "red",
  SHELL = "green",
  TERM = "yellow",
  NONE = "bg",
}
local mode_alias = {
  ["n"] = "NORMAL",
  ["no"] = "OP",
  ["nov"] = "OP",
  ["noV"] = "OP",
  ["no"] = "OP",
  ["niI"] = "NORMAL",
  ["niR"] = "NORMAL",
  ["niV"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "V-LINE",
  [""] = "V-BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT",
  [""] = "V-BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["ix"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rc"] = "REPLACE",
  ["Rv"] = "V-REPLACE",
  ["Rx"] = "REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "COMMAND",
  ["ce"] = "COMMAND",
  ["r"] = "ENTER",
  ["rm"] = "MORE",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
  ["nt"] = "NORMAL",
  ["null"] = "NONE",
}

local components = {
  active = { {}, {} }, -- statusline sections left & right
  inactive = { {} },
}

local function is_file(bufnr)
  local bt = api.nvim_buf_get_option(bufnr, "buftype")
  return bt ~= "nofile" and bt ~= "terminal"
end

local function file_readonly(bufnr)
  if api.nvim_buf_get_option(bufnr, "filetype") == "help" then return false end
  if api.nvim_buf_get_option(bufnr, "readonly") then return true end
  return false
end

local function file_modified(bufnr)
  if api.nvim_buf_get_option(bufnr, "modifiable") and api.nvim_buf_get_option(bufnr, "modified") then return true end
  return false
end

local function file_name()
  local bufnr = api.nvim_win_get_buf(0)
  local filename = api.nvim_buf_get_name(bufnr)
  filename = fn.fnamemodify(filename, ":t")

  if is_file(bufnr) and file_readonly(bufnr) then return filename .. " " end
  if file_modified(bufnr) then return filename .. " " end
  return filename
end

-- Vi mode
local function mode() return mode_alias[api.nvim_get_mode().mode] end

table.insert(components.active[1], {
  provider = function() return string.format(" %s ", mode()) end,
  short_provider = function() return string.format(" %s ", mode():sub(1, 1)) end,
  icon = "",
  hl = function()
    return {
      fg = palette.base,
      bg = vi_mode.get_mode_color(),
      style = "bold",
    }
  end,
})

local function split(str, sep)
  local res = {}
  local n = 1
  for w in str:gmatch("([^" .. sep .. "]*)") do
    res[n] = res[n] or w -- only set once (so the blank after a string is ignored)
    if w == "" then n = n + 1 end -- step forwards on a blank but not a string
  end
  return res
end

local function file_icon()
  local icon = {
    str = " ",
    always_visible = true,
  }

  local filename = api.nvim_buf_get_name(api.nvim_win_get_buf(0))
  filename = fn.fnamemodify(filename, ":t")
  local extension = fn.fnamemodify(filename, ":e")

  if filename == "" then return icon end

  local icon_str, icon_hlname = require("nvim-web-devicons").get_icon(filename, extension, {
    default = false,
  })

  icon.str = string.format(" %s ", icon_str or "")

  --[[ if icon_hlname then
        local fg = api.nvim_get_hl_by_name(icon_hlname, true).foreground
        if fg then
            icon.hl = {
                fg = string.format("#%06x", fg)
             }
        end
    end ]]

  return icon
end

table.insert(components.active[1], {
  provider = "",
  icon = file_icon,
  hl = {
    bg = "base",
  },
})

local function file_path()
  local bufnr = api.nvim_win_get_buf(0)

  if not is_file(bufnr) then return "" end

  local filename = api.nvim_buf_get_name(bufnr)
  local fp = fn.fnamemodify(filename, ":~:.")
  if fn.fnamemodify(filename, ":t") ~= "" then
    -- not unnamed file
    fp = fn.fnamemodify(fp, ":h")
  end

  local tbl = split(fp, "/")
  local len = #tbl

  if len > 2 and not tbl[0] == "~" or len > 3 then
    return table.concat(tbl, "/", len - 1) -- path to last 2 folders
  else
    return ""
  end
end

table.insert(components.active[1], {
  provider = file_path,
  enabled = function() return api.nvim_win_get_width(0) >= 80 end,
  hl = {
    fg = "grey",
    bg = "base",
  },
})

local function file_info()
  local bufnr = api.nvim_win_get_buf(0)
  local filename = api.nvim_buf_get_name(bufnr)
  filename = fn.fnamemodify(filename, ":t")

  local readonly_str = ""
  local modified_str = ""
  if api.nvim_buf_get_option(bufnr, "readonly") then readonly_str = " " end

  if api.nvim_buf_get_option(bufnr, "modified") then modified_str = " " end

  return readonly_str .. filename .. " " .. modified_str
end

-- File info
table.insert(components.active[1], {
  provider = file_info,
  hl = {
    fg = "fg",
    bg = "base",
  },
  left_sep = "",
  right_sep = {
    str = "slant_right",
    hl = {
      fg = "base",
      bg = "bg",
    },
  },
})

local function lsp_check_diagnostics()
  if isempty(vim.lsp.get_active_clients {
    bufnr = 0,
  }) then return "" end
  local diagnostics = diagnostic.get(0, {
    severity = {
      min = diagnostic.severity.INFO,
    },
  })
  if not isempty(diagnostics) then return "  " end
  return "   "
end

table.insert(components.active[1], {
  provider = lsp_check_diagnostics,
  hl = {
    fg = "grey",
    bg = "bg",
  },
})

local function get_diagnostic_count(severity)
  local count = #diagnostic.get(0, {
    severity = severity,
  })
  return count ~= 0 and count .. " " or ""
end

table.insert(components.active[1], {
  provider = function() return get_diagnostic_count(diagnostic.severity.ERROR) end,
  icon = "  ",
  hl = {
    fg = "red",
    bg = "bg",
  },
})
table.insert(components.active[1], {
  provider = function() return get_diagnostic_count(diagnostic.severity.WARN) end,
  icon = "  ",
  hl = {
    fg = "orange",
    bg = "bg",
  },
})
table.insert(components.active[1], {
  provider = function() return get_diagnostic_count(diagnostic.severity.INFO) end,
  icon = "  ",
  hl = {
    fg = "blue",
    bg = "bg",
  },
})

-- RIGHT

-- Blame
local ok, git_blame = pcall(require, "gitblame")
if ok then
  local function git_blame_provider()
    if git_blame.is_blame_text_available() then
      local message = git_blame.get_current_blame_text()
      -- Return the message with the max size of 30 characters
      return message:sub(1, 50) .. " "
    else
      return ""
    end
  end

  table.insert(components.active[2], {
    provider = git_blame_provider,
    hl = {
      fg = "grey",
      bg = "bg",
    },
  })
end

-- Diff
table.insert(components.active[2], {
  provider = "git_diff_added",
  icon = " ",
  hl = {
    fg = "green",
    bg = "bg",
  },
  right_sep = " ",
})
table.insert(components.active[2], {
  provider = "git_diff_changed",
  icon = " ",
  hl = {
    fg = "orange",
    bg = "bg",
  },
  right_sep = " ",
})
table.insert(components.active[2], {
  provider = "git_diff_removed",
  icon = " ",
  hl = {
    fg = "red",
    bg = "bg",
  },
})

-- insert a string separator
table.insert(components.active[2], {
  provider = "  ",
  hl = {
    fg = "grey",
    bg = "bg",
  },
})

table.insert(components.active[2], {
  provider = "git_branch",
  hl = {
    fg = "grey",
    bg = "bg",
  },
  right_sep = " ",
})

table.insert(components.inactive[1], {
  provider = file_name,
  hl = {
    fg = "fg",
    bg = "base",
  },
  right_sep = {
    str = "slant_right",
    hl = {
      fg = "base",
      bg = "bg",
    },
  },
})

local theme = palette
theme["bg"] = "NONE"

require("feline").setup {
  theme = palette,
  vi_mode_colors = vi_mode_colors,
  components = components,
  force_inactive = {
    filetypes = { "^packer$", "NvimTree", "^qf$", "^help$", "Outline", "Trouble", "dap-repl", "^dapui" },
    buftypes = {},
    bufnames = {},
  },
}

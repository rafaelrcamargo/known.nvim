require("auto-save").setup {
  condition = function()
    vim.defer_fn(function()
      -- Don't auto-save if the LSP has errors
      local errors = require("utils.lsp").get_diag_count()
      if errors < 1 then vim.cmd "silent! w" end
    end, 300)

    return false -- Always return false, so the callback can run
  end,
}

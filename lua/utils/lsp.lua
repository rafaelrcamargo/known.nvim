-- Pre-allocate the M table to avoid the overhead
local M = { get_diag_count = function() end }

-- Require local vim modules
local diag, startswith = vim.diagnostic, vim.startswith

M.get_diag_count = function()
  local diagnostics = diag.get(0)
  local count = { 0, 0, 0, 0 }

  for _, diagnostic in ipairs(diagnostics) do
    if vim.startswith(diag.get_namespace(diagnostic.namespace).name, "vim.lsp") then
      count[diagnostic.severity] = count[diagnostic.severity] + 1
    end
  end

  error_count = count[diag.severity.ERROR]
  warning_count = count[diag.severity.WARN]
  info_count = count[diag.severity.INFO]
  hint_count = count[diag.severity.HINT]

  return error_count, warning_count, info_count, hint_count
end

return M

vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.keymap.set("n", "of", require("ufo").openAllFolds)
vim.keymap.set("n", "cf", require("ufo").closeAllFolds)

vim.keymap.set("n", "tf", "za")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
local language_servers = require("lspconfig").util.available_servers()
for _, ls in ipairs(language_servers) do
  require("lspconfig")[ls].setup {
    capabilities = capabilities,
  }
end

require("ufo").setup {}

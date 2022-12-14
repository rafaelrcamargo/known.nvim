require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "sumneko_lua", "pyright", "tsserver", "tailwindcss", "stylelint_lsp", "jsonls", "rust_analyzer" },
}

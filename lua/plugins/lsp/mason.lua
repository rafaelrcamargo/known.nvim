require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "pyright", "tsserver", "tailwindcss", "stylelint_lsp", "jsonls", "rust_analyzer" },
}

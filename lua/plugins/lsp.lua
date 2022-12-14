local keymap, buf, diagnostic = vim.keymap.set, vim.lsp.buf, vim.diagnostic
local lspconfig = require "lspconfig"

local arg = {
  buffer = 0,
}
local on_attach = function()
  keymap("n", "rn", buf.rename, {})
  keymap("n", "ca", buf.code_action, {})
  keymap("n", "fr", require("telescope.builtin").lsp_references, {})

  keymap("n", "hh", buf.hover, arg)
  keymap("n", "gd", buf.definition, arg)
  keymap("n", "gt", buf.type_definition, arg)
  keymap("n", "<leader>dn", diagnostic.goto_next, arg)
  keymap("n", "<leader>dp", diagnostic.goto_prev, arg)

  keymap("n", "<C-f>", buf.format, arg)
end

-- Setup LSP for Lua
lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
}

-- Setup LSP for Python
lspconfig.pyright.setup {
  on_attach = on_attach,
}

-- Setup TSServer LSP for JavaScript, TypeScript + JS/TS React
lspconfig.tsserver.setup {
  on_attach = on_attach,
}

-- Setup Tailwind CSS LSP for Tailwind CSS
lspconfig.tailwindcss.setup {
  on_attach = on_attach,
}

-- Setup Stylelint LSP for CSS
lspconfig.stylelint_lsp.setup {
  on_attach = on_attach,
}

-- Setup JSON LSP for JSON
lspconfig.jsonls.setup {
  on_attach = on_attach,
}

-- Setup Rust Analyzer LSP for Rust
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
}

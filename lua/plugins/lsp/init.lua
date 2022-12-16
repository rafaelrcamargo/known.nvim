local keymap, buf, diagnostic = vim.keymap.set, vim.lsp.buf, vim.diagnostic
local lspconfig = require "lspconfig"

local ok, neodev = pcall(require, "neodev")
if ok then neodev.setup {} end

local arg = {
  buffer = 0,
}
local on_attach = function()
  keymap("n", "<leader>rn", buf.rename, {})
  keymap("n", "<leader>ca", buf.code_action, {})
  keymap("n", "<leader>fr", require("telescope.builtin").lsp_references, {})

  keymap("n", "<leader>hh", buf.hover, arg)
  keymap("n", "<leader>gd", buf.definition, arg)
  keymap("n", "<leader>gt", buf.type_definition, arg)
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

-- Setup LSP for OCaml
lspconfig.ocamllsp.setup {
  on_attach = on_attach,
}

local signs = {
  {
    name = "DiagnosticSignError",
    text = "",
  },
  {
    name = "DiagnosticSignWarn",
    text = "",
  },
  {
    name = "DiagnosticSignHint",
    text = "",
  },
  {
    name = "DiagnosticSignInfo",
    text = "",
  },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, {
    texthl = sign.name,
    text = sign.text,
    numhl = sign.name,
  })
end

local config = {
  -- disable virtual text
  virtual_text = {
    prefix = "   ",
  },
  -- show signs
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = false,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)

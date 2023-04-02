local keymap, buf, diagnostic = vim.keymap.set, vim.lsp.buf, vim.diagnostic
local lspconfig = require "lspconfig"

local ok, neodev = pcall(require, "neodev")
if ok then neodev.setup {} end

-- In this case, we create a function that lets us more easily define mappings specific
-- for LSP related items. It sets the mode, buffer and description for us each time.
local nmap = function(keys, func, desc)
  if desc then desc = "LSP: " .. desc end

  vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
end

local arg = {
  buffer = 0,
}
local on_attach = function(client)
  if client.server_capabilities.colorProvider then
    -- Attach document colour support
    require("document-color").buf_attach(bufnr)
  end

  nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

  nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
  nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
  nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
  nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
  nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

  -- See `:help K` for why this keymap
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

  keymap("n", "<leader>dn", diagnostic.goto_next, arg)
  keymap("n", "<leader>dp", diagnostic.goto_prev, arg)

  keymap("n", "<C-f>", buf.format, arg)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- You are now capable!
capabilities.textDocument.colorProvider = {
  dynamicRegistration = true,
}

local servers = {
  "lua_ls",
  "pyright",
  "tsserver",
  "tailwindcss",
  "stylelint_lsp",
  "jsonls",
  "rust_analyzer",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local signs = {
  {
    name = "DiagnosticSignError",
    highlight = "DiagnosticSignErrorHighlight",
    text = "",
  },
  {
    name = "DiagnosticSignWarn",
    highlight = "DiagnosticSignWarnHighlight",
    text = "",
  },
  {
    name = "DiagnosticSignHint",
    highlight = "DiagnosticSignHintHighlight",
    text = "",
  },
  {
    name = "DiagnosticSignInfo",
    highlight = "DiagnosticSignInfoHighlight",
    text = "",
  },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, {
    linehl = sign.highlight,
    texthl = sign.name,
    numhl = sign.name,
    text = sign.text,
  })
end

-- Define the Line Highlighting for the signs
vim.cmd [[highlight DiagnosticSignErrorHighlight guibg=#4e2f2d]]
vim.cmd [[highlight DiagnosticSignWarnHighlight guibg=#493d2a]]
vim.cmd [[highlight DiagnosticSignHintHighlight guibg=#3f412d]]
vim.cmd [[highlight DiagnosticSignInfoHighlight guibg=#343f3c]]

local config = {
  -- disable virtual text
  virtual_text = {
    prefix = "   ",
  },
  -- show signs
  signs = {
    active = signs,
  },
  underline = true,
  severity_sort = true,
  update_in_insert = true,
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

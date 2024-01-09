local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function()
  -- Packer config
  use {
    "wbthomason/packer.nvim", -- Package manager

    -----------------------------
    -------- Essentials ---------
    -----------------------------

    { -- Required by *
      "nvim-lua/plenary.nvim",
      module = "plenary",
    },
    { -- Dev icons, used everywhere
      "kyazdani42/nvim-web-devicons",
      module = "nvim-web-devicons",
    },

    -----------------------------
    -------- Profiling ----------
    -----------------------------

    "lewis6991/impatient.nvim",
    {
      "dstein64/vim-startuptime",
      cmd = "StartupTime",
    },

    -----------------------------
    -------- Colorscheme --------
    -----------------------------

    { -- A Catppuccin patched to look like gruvbox-material, but with a decent performance.
      "catppuccin/nvim",
      as = "catppuccin", -- I mean, it works...
      config = function() require("plugins.ui.colorscheme").catppuccin() end,
    },

    -----------------------------
    -------- Treesitter ---------
    -----------------------------

    {
      "nvim-treesitter/nvim-treesitter", -- Syntax highlighting
      run = function() require("plugins.misc.treesitter").install() end,
      config = function() require("plugins.misc.treesitter").config() end,
    },
    {
      "JoosepAlviste/nvim-ts-context-commentstring", -- Set commentstring
      event = "ModeChanged",
    },
    { -- Additional text objects via treesitter
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = "nvim-treesitter",
    },

    -----------------------------
    --------- Telescope ---------
    -----------------------------

    {
      "nvim-telescope/telescope.nvim", -- Fuzzy finder
      event = "ModeChanged",
      config = function() require "plugins.misc.telescope" () end,
    },
    {
      "AckslD/nvim-neoclip.lua", -- Clipboard manager
      after = "telescope.nvim",
      config = function() require "plugins.misc.neoclip" end,
    },

    -----------------------------
    ----------- UI --------------
    -----------------------------

    {
      "feline-nvim/feline.nvim", -- Statusline
      config = function() require "plugins.ui.feline" end,
    },
    {
      "akinsho/bufferline.nvim",
      tag = "v3.*",
      config = function() require "plugins.ui.bufferline" end,
    },
    {
      "nvim-tree/nvim-tree.lua",
      tag = "nightly",
      cmd = "NvimTreeToggle",
      config = function() require "plugins.ui.tree" end,
    },
    {
      "lukas-reineke/indent-blankline.nvim", -- Indentation lines
      event = "BufRead",
      after = "nvim-treesitter",
      config = function() require "plugins.ui.indentline" end,
    },
    {
      "RRethy/vim-illuminate",
      event = "CursorHold",
      config = function() require("plugins.ui.illuminate").config() end,
      setup = function() require("plugins.ui.illuminate").setup() end,
    },
    {
      "glepnir/dashboard-nvim", -- Main dashboard
      config = function() require "plugins.ui.dashboard" end,
    },
    {
      "mrshmllow/document-color.nvim",
      config = function() require("document-color").setup { mode = "background" } end,
    },
    {
      "brenoprata10/nvim-highlight-colors",
      config = function() require("nvim-highlight-colors").setup {} end,
    },
    {
      "kevinhwang91/nvim-ufo",
      keys = { "of", "cf", "tf" },
      requires = "kevinhwang91/promise-async",
      config = function() require "plugins.lsp.ufo" end,
    },

    -----------------------------
    ----------- Misc ------------
    -----------------------------

    {
      "akinsho/toggleterm.nvim",
      tag = "*",
      config = function() require("toggleterm").setup() end,
    },
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
      config = function() require("trouble").setup {} end,
    },
    {
      "mbbill/undotree",
      cmd = "UndotreeToggle",
    },
    {
      "mg979/vim-visual-multi", -- Multiple cursors
      event = "CursorMoved",
      setup = function() vim.g.VM_default_mappings = 0 end,
    },
    {
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
      ft = { "markdown" },
    },
    {
      "numToStr/Comment.nvim", -- Smart commenting
      keys = { "gc", "gb" },
      after = "nvim-treesitter",
      config = function() require "plugins.misc.comment" end,
    },
    {
      "Pocco81/auto-save.nvim", -- Auto save, when possible
      config = function() require "plugins.misc.autosave" end,
    },
    {
      "gbprod/cutlass.nvim", -- Correct delete copying
      keys = { "d" },
      config = function() require "plugins.misc.cutlass" end,
    },
    {
      "github/copilot.vim", -- Pair AI
      event = "InsertEnter",
    },
    {
      "tjdevries/vim-inyoface", -- Make comments appear IN YO FACE
      keys = { "c" },
      config = function() require "plugins.misc.inyoface" end,
    },
    {
      "windwp/nvim-autopairs", -- Auto pairs
      event = "InsertEnter",
      config = function() require("nvim-autopairs").setup() end,
    },
    {
      "folke/todo-comments.nvim", -- Special comment highlighting
      event = "BufRead",
      config = function() require "plugins.misc.todo" end,
    },
    {
      "folke/twilight.nvim",
      cmd = "Twilight",
      config = function() require("twilight").setup() end,
    },
    {
      "b0o/SchemaStore.nvim",
      ft = { "json", "yaml" },
    }, -- TODO: Test this plugin

    -----------------------------
    ----------- Git -------------
    -----------------------------

    {
      "lewis6991/gitsigns.nvim", -- Git mods highlight
      event = "BufRead",
      config = function() require "plugins.git.signs" () end,
    },
    {
      "f-person/git-blame.nvim",
      event = "CursorMoved",
      setup = function() require "plugins.git.blame" () end,
    },

    -----------------------------
    ----------- LSP -------------
    -----------------------------

    {
      "neovim/nvim-lspconfig",
      event = "BufRead",
      requires = {
        -- Automatically install LSPs to stdpath for neovim
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",
      },
      config = function() require "plugins.lsp" end,
    },

    {
      "williamboman/mason.nvim",
      cmd = "Mason",
      config = function() require "plugins.lsp.mason" end,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      after = "mason.nvim",
      event = "BufRead",
    },

    {
      "zbirenbaum/neodim",
      after = "nvim-lspconfig",
      event = "CursorMoved",
      config = function() require "plugins.lsp.neodim" end,
    },
    {
      "ahmedkhalf/project.nvim",
      after = "nvim-lspconfig",
      event = "BufRead",
      config = function() require("project_nvim").setup {} end,
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      event = "ModeChanged",
      config = function() require "plugins.lsp.null" end,
    },
    {
      "j-hui/fidget.nvim",
      event = { "BufRead" },
      tag = "legacy",
      config = function()
        require("fidget").setup {
          window = {
            blend = 0,
          },
          timer = {
            spinner_rate = 100, -- frame rate of spinner animation, in ms
            fidget_decay = 100, -- how long to keep around empty fidget, in ms
            task_decay = 100, -- how long to keep around completed task, in ms
          },
        }
      end,
    },

    -----------------------------
    --------- Completion --------
    -----------------------------

    { -- Autocompletion
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-path",
      },
    },
  }

  if packer_bootstrap then require("packer").sync() end
end)

-- nvim-cmp setup
local cmp = require "cmp"
local luasnip = require "luasnip"

luasnip.config.setup {}

cmp.setup {
  completion = {
    autocomplete = false,
  },
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "luasnip" },
    { name = "path" },
  }, {
    { name = "buffer", keyword_length = 3 },
  }),
  sorting = {},
}

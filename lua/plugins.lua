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

    {
      "nvim-lua/plenary.nvim",
      module = "plenary",
    }, -- Required by *
    {
      "kyazdani42/nvim-web-devicons",
      module = "nvim-web-devicons",
    }, -- Dev icons, used everywhere

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

    -- {
    --   "catppuccin/nvim", -- A Catppuccin patched to look like gruvbox-material, but with a decent performance.
    --   as = "catppuccin", -- I know, sounds weird, but works.
    --   config = function() require("plugins.ui.colorscheme").catppuccin() end,
    -- },\
    {
      "rebelot/kanagawa.nvim",
      config = function()
        require("kanagawa").setup {
          transparent = true,
          dimInactive = true,
        }
      end,
    },
    {
      "xiyaowong/nvim-transparent",
      config = function()
        require("transparent").setup {
          enable = true,
          extra_groups = {
            "NvimTreeNormal",
            "FloatBorder",
            "FloatBorderNC",
            "TelescopeBorder",
            "BufferLineTabClose",
            "BufferlineBufferSelected",
            "BufferLineFill",
            "BufferLineBackground",
            "BufferLineSeparator",
            "BufferLineIndicatorSelected",
          },
        }
      end,
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
      config = function()
        require("document-color").setup {
          -- Default options
          mode = "background", -- "background" | "foreground" | "single"
        }
      end,
    },
    {
      "brenoprata10/nvim-highlight-colors",
      config = function()
        require("nvim-highlight-colors").setup {}
      end,
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
      "CRAG666/code_runner.nvim", -- Run code
      cmd = "RunCode",
      config = function() require("plugins.misc.runner").config() end,
      setup = function() require("plugins.misc.runner").setup() end,
    },
    {
      "mg979/vim-visual-multi", -- Multiple cursors
      keys = { "n", "d" },
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
      event = "CursorMoved",
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
      module = "inyoface",
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
    }, -- TODO: Test out this plugin

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

    {
      "ms-jpq/coq_nvim",
      branch = "coq",
      event = "InsertEnter",
      setup = function() require "plugins.coq" end,
    },
    {
      "ms-jpq/coq.artifacts",
      event = "InsertEnter",
      branch = "artifacts",
    },
    {
      "ms-jpq/coq.thirdparty",
      branch = "3p",
      event = "InsertEnter",
      config = function() require "plugins.coq.thirdparty" end,
    },
  }

  if packer_bootstrap then require("packer").sync() end
end)

local augroup, autocmd = vim.api.nvim_create_augroup, vim.api.nvim_create_autocmd

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = augroup("Packer", { clear = true })
autocmd("BufWritePost", {
  command = "source <afile> | PackerCompile",
  group = packer_group,
  pattern = vim.fn.expand "$MYVIMRC",
})

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

local highlight_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  callback = function() vim.highlight.on_yank() end,
  group = highlight_group,
  pattern = "*",
})

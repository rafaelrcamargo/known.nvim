-- Pre-load the colorscheme if possible
local ok, _ = pcall(vim.cmd, "colorscheme catppuccin")
if not ok then vim.cmd("silent! colorscheme slate") end

-- Disable some default loaded plugins
require("config.loaded")

-- Setting our leader before plugins/keymaps are loaded:
vim.g.mapleader = " " -- Global leader
vim.g.maplocalleader = " " -- Local leader

require("config.basics") -- Load plugins

vim.schedule(function()
    require("config.keymaps") -- Load keymaps
end)

if require("config.setup")() then return end

-- Packer config
return require("packer").startup(function()
    use("wbthomason/packer.nvim") -- Package manager

    -----------------------------
    -------- Essentials ---------
    -----------------------------

    use({
        "nvim-lua/plenary.nvim",
        module = "plenary"
     }) -- Required by *
    use({
        "kyazdani42/nvim-web-devicons",
        module = "nvim-web-devicons"
     }) -- Dev icons, used everywhere

    -----------------------------
    -------- Profiling ----------
    -----------------------------

    use("lewis6991/impatient.nvim") -- Impatient and StartupTime,
    use("dstein64/vim-startuptime") -- for my own curiosity.

    -----------------------------
    -------- Colorscheme --------
    -----------------------------

    --[[ use({
        "Yagua/nebulous.nvim", -- Cool alternative material colorscheme
        config = function()
            require("nebulous").setup({
                variant = "fullmoon",
                disable = { background = true }
             })
        end
     }) ]]

    use({
        "catppuccin/nvim", -- A Catppuccin patched to look like gruvbox-material, but with a decent performance.
        as = "catppuccin", -- I know, sounds weird, but works.
        config = function() require("plugins.catppuccin") end
     })

    -----------------------------
    -------- Treesitter ---------
    -----------------------------

    use({ {
        "nvim-treesitter/nvim-treesitter", -- Syntax highlighting
        run = function() require("plugins.treesitter").install() end,
        config = function() require("plugins.treesitter").config() end
     }, {
        "windwp/nvim-ts-autotag", -- Auto close tags
        after = "nvim-treesitter",
        event = "InsertEnter"
     }, {
        "JoosepAlviste/nvim-ts-context-commentstring", -- Set commentstring
        after = "nvim-treesitter",
        event = "ModeChanged"
     }, {
        "p00f/nvim-ts-rainbow", -- Rainbow parentheses
        after = "nvim-treesitter"
     } })

    -----------------------------
    --------- Telescope ---------
    -----------------------------

    use({ {
        "nvim-telescope/telescope.nvim", -- Fuzzy finder
        cmd = "Telescope",
        event = "ModeChanged",
        config = function() require("plugins.telescope") end
     }, {
        "AckslD/nvim-neoclip.lua", -- Clipboard manager
        after = "telescope.nvim",
        config = function() require("plugins.neoclip") end
     } })

    -----------------------------
    ----------- UI --------------
    -----------------------------

    use({
        "feline-nvim/feline.nvim", -- Statusline
        config = function() require("plugins.feline") end
     })
    use({
        "akinsho/bufferline.nvim",
        tag = "v3.*",
        event = "BufWinEnter",
        config = function() require("bufferline").setup() end
     })
    use({
        "nvim-tree/nvim-tree.lua",
        tag = "nightly",
        cmd = "NvimTreeToggle",
        config = function() require("plugins.tree") end
     })

    -----------------------------
    ----------- Misc ------------
    -----------------------------

    use({
        "numToStr/Comment.nvim", -- Commenting plugin
        after = "nvim-treesitter",
        keys = { "gc", "gb" },
        config = function() require("plugins.comment") end
     })
    use({
        "Darazaki/indent-o-matic", -- Auto indentation plugin
        event = "ModeChanged"
     })
    use({
        "lukas-reineke/indent-blankline.nvim", -- Indentation lines
        event = "BufRead",
        after = "nvim-treesitter",
        config = function() require("plugins.indentline") end
     })
    use({
        "gbprod/cutlass.nvim", -- Correct delete copying
        keys = { "d" },
        event = "CursorMoved",
        config = function() require("plugins.cutlass") end
     })
    use({
        "glepnir/dashboard-nvim", -- Main dashboard
        config = function() require("plugins.dashboard") end
     })
    use({
        "github/copilot.vim", -- Pair AI
        event = "InsertEnter"
     })
    use({
        "tjdevries/vim-inyoface", -- Make comments appear IN YO FACE
        keys = { "cc" },
        module = "inyoface",
        config = function() require("plugins.inyoface") end
     })
    use({
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function() require("nvim-autopairs").setup() end
     })
    use({
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        event = "BufRead",
        config = function() require("plugins.todo") end
     })
    use({
        "b0o/SchemaStore.nvim",
        module = "SchemaStore",
        ft = { "json", "yaml" }
     }) -- TODO: Test out this plugin

    use({
        "folke/twilight.nvim",
        cmd = "Twilight",
        config = function() require("twilight").setup() end
     })

    -----------------------------
    ----------- Git -------------
    -----------------------------

    use({
        "lewis6991/gitsigns.nvim", -- Git mods highlight
        disable = vim.fn.executable "git" == 0,
        event = "BufRead",
        config = function() require("gitsigns").setup() end
     })

    -----------------------------
    ----------- LSP -------------
    -----------------------------

    use({
        "neovim/nvim-lspconfig",
        config = function() require("plugins.lsp") end
     })
    use({
        "zbirenbaum/neodim",
        after = "nvim-lspconfig",
        event = "BufRead",
        config = function() require("plugins.neodim") end
     })

    -----------------------------
    --------- Completion --------
    -----------------------------

    use({ {
        "ms-jpq/coq_nvim",
        branch = "coq",
        event = "InsertEnter",
        setup = function() require("plugins.coq") end
     }, {
        "ms-jpq/coq.artifacts",
        event = "InsertEnter",
        after = "coq_nvim",
        branch = "artifacts"
     }, {
        "ms-jpq/coq.thirdparty",
        branch = "3p",
        ft = { "lua" },
        event = "InsertEnter",
        after = "coq_nvim",
        config = function() require("plugins.coq.thirdparty") end
     } })
end)

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

    use({ "lewis6991/impatient.nvim", {
        "dstein64/vim-startuptime",
        cmd = "StartupTime"
     } })

    -----------------------------
    -------- Colorscheme --------
    -----------------------------

    --[[ use({
        "Yagua/nebulous.nvim", -- Cool alternative material colorscheme
        config = function() require("plugins.colorscheme").nebulous() end
     }) ]]

    use({
        "catppuccin/nvim", -- A Catppuccin patched to look like gruvbox-material, but with a decent performance.
        as = "catppuccin", -- I know, sounds weird, but works.
        config = function() require("plugins.colorscheme").catppuccin() end
     })

    -----------------------------
    -------- Treesitter ---------
    -----------------------------

    use({ {
        "nvim-treesitter/nvim-treesitter", -- Syntax highlighting
        run = function() require("plugins.treesitter").install() end,
        config = function() require("plugins.treesitter").config() end
     }, {
        "JoosepAlviste/nvim-ts-context-commentstring", -- Set commentstring
        event = "ModeChanged"
     } })

    -----------------------------
    --------- Telescope ---------
    -----------------------------

    use({ {
        "nvim-telescope/telescope.nvim", -- Fuzzy finder
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
        after = "nvim-web-devicons",
        config = function() require("plugins.feline") end
     })
    use({
        "akinsho/bufferline.nvim",
        tag = "v3.*",
        event = "BufWinEnter",
        config = function() require("plugins.bufferline") end
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
        "numToStr/Comment.nvim", -- Smart commenting
        keys = { "gc", "gb" },
        after = "nvim-treesitter",
        config = function() require("plugins.comment") end
     })
    use({
        "Darazaki/indent-o-matic", -- Auto indentation
        event = "ModeChanged"
     })
    use({
        "Pocco81/auto-save.nvim", -- Auto save, when possible
        keys = { "d", "x" },
        event = "InsertLeave",
        config = function() require("auto-save").setup() end
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
        config = function() require("plugins.cutlass") end
     })
    --[[ use({
        "glepnir/dashboard-nvim", -- Main dashboard
        config = function() require("plugins.dashboard") end
     }) ]]
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
        "windwp/nvim-autopairs", -- Auto pairs
        event = "InsertEnter",
        config = function() require("nvim-autopairs").setup() end
     })
    use({
        "folke/todo-comments.nvim", -- Special comment highlighting
        event = "BufRead",
        config = function() require("plugins.todo") end
     })
    use({
        "folke/twilight.nvim",
        cmd = "Twilight",
        config = function() require("twilight").setup() end
     })

    use({
        "b0o/SchemaStore.nvim",
        ft = { "json", "yaml" }
     }) -- TODO: Test out this plugin

    -----------------------------
    ----------- Git -------------
    -----------------------------

    use({
        "lewis6991/gitsigns.nvim", -- Git mods highlight
        event = "BufRead",
        config = function() require("gitsigns").setup() end
     })

    -----------------------------
    ----------- LSP -------------
    -----------------------------

    use({ {
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = function() require("plugins.mason") end
     }, {
        "williamboman/mason-lspconfig.nvim",
        after = "mason.nvim"
     }, {
        "neovim/nvim-lspconfig",
        config = function() require("plugins.lsp") end
     }, {
        "zbirenbaum/neodim",
        keys = { "gd" },
        config = function() require("plugins.neodim") end
     } })
    use({
        "jose-elias-alvarez/null-ls.nvim",
        after = "nvim-lspconfig",
        event = "ModeChanged",
        config = function() require("plugins.null") end
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
        branch = "artifacts"
     }, {
        "ms-jpq/coq.thirdparty",
        branch = "3p",
        event = "InsertEnter",
        config = function() require("plugins.coq.thirdparty") end
     } })
end)

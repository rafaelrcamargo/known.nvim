-- Disable some default loaded plugins
require("config.loaded")

-- Setting our leader before plugins/keymaps are loaded:
vim.g.mapleader = " " -- Global leader
vim.g.maplocalleader = " " -- Local leader

-- Load plugins
require("config.basics")

vim.schedule(function()
    -- Load keymaps
    require("config.keymaps")
end)

if require("config.setup")() then
    return
end

-- Packer config
return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    -----------------------------
    -------- Essentials ---------
    -----------------------------

    use("lewis6991/impatient.nvim") -- Impatient and StartupTime,
    use("dstein64/vim-startuptime") -- for my own curiosity.
    use({
        "nvim-lua/plenary.nvim",
        module = "plenary"
     }) -- Required by *
    use({
        "kyazdani42/nvim-web-devicons",
        module = "nvim-web-devicons"
     }) -- Fun icons (Great w/ Telescope)

    -----------------------------
    -------- Colorscheme --------
    -----------------------------

    use({
        "Yagua/nebulous.nvim", -- Cool alternative material colorscheme
        config = function()
            require("nebulous").setup({
                variant = "fullmoon",
                disable = {
                    background = true
                 }
             })

            vim.cmd("colorscheme nebulous")
        end
     })

    --[[ use({
        "catppuccin/nvim", -- A Catppuccin patched to look like material-gruvbox, but with a decent performance
        as = "gruvbox", -- I know, sounds weird, but works.
        config = function()
          require("plugins.gruvbox")
          vim.cmd("colorscheme gruvbox")
        end
     }) ]]

    -----------------------------
    -------- Treesitter ---------
    -----------------------------

    use({ {
        "nvim-treesitter/nvim-treesitter", -- Syntax highlighting
        run = function()
            require("nvim-treesitter.install").update({
                with_sync = true
             })()
        end,
        config = function() require("plugins.treesitter") end
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
        config = function() require("bufferline").setup({}) end,
        event = "BufWinEnter"
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
        config = function() vim.api.nvim_set_keymap("n", "<leader>cc", "<cmd>call inyoface#toggle_comments()<CR>", {}) end
     })
    use({
        "NvChad/nvim-colorizer.lua",
        event = "BufRead",
        config = function()
            require("colorizer").setup({
                user_default_options = {
                    tailwind = true,
                    names = false
                 }
             })
        end
     })
    use({
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function() require("nvim-autopairs").setup({}) end
     })

    use({
        "b0o/SchemaStore.nvim",
        module = "SchemaStore",
        ft = { "json", "yaml" }
     }) -- Testing out this plugin

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

    -- Think about it:
    -- use("simrat39/inlay-hints.nvim")
end)

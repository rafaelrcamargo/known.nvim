-- Disable some default loaded plugins
require("loaded")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load plugins
require("basics")
require("keymaps")

-- Load catppuccin after the packer initialization
vim.schedule(function() vim.cmd("colorscheme catppuccin") end)

-- Packer config
return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    -- Impatient and StartupTime for my curiosity
    use("lewis6991/impatient.nvim")
    use("dstein64/vim-startuptime")

    -- Required by *
    use("nvim-lua/plenary.nvim")

    -- Fun icons (Great w/ Telescope)
    use("kyazdani42/nvim-web-devicons")

    use({
        "neoclide/coc.nvim",
        branch = "release",
        run = "yarn install --frozen-lockfile",
        config = function() require("plugins.coc") end
     })

    use({ {
        "nvim-treesitter/nvim-treesitter", -- Syntax highlighting
        run = ":TSUpdate",
        config = function() require("plugins.treesitter") end
     }, {
        "windwp/nvim-ts-autotag", -- Auto close tags
        after = "nvim-treesitter"
     }, {
        "JoosepAlviste/nvim-ts-context-commentstring", -- Set commentstring
        after = "nvim-treesitter"
     }, {
        "p00f/nvim-ts-rainbow", -- Rainbow parentheses
        after = "nvim-treesitter"
     } })

    use({ {
        "nvim-telescope/telescope.nvim", -- Fuzzy finder
        event = "CursorHold",
        config = function() require("plugins.telescope") end
     }, {
        "fannheyward/telescope-coc.nvim",
        after = { "telescope.nvim", "coc.nvim" },
        config = function() require("telescope").load_extension("coc") end
     } })

    -------------------
    --- Colorscheme ---
    -------------------

    --[[ use({
        "~/.config/nvim/lua/plugins/gruvbox-material.nvim", -- Gruvbox baby!
        config = function()
            vim.g.gruvbox_baby_transparent_mode = true
            vim.cmd("colorscheme gruvbox-baby")
        end
     }) ]]

    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato",
                transparent_background = true
             })
        end
     }

    use({
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function() require("trouble").setup() end
     })

    -------------------
    ------ Misc -------
    -------------------

    use({
        "nvim-lualine/lualine.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
            opt = true
         },
        config = function()
            require("lualine").setup({
                options = {
                    section_separators = "",
                    component_separators = "",
                    theme = "catppuccin"
                 }
             })
        end
     })
    use({
        "numToStr/Comment.nvim", -- Commenting plugin
        after = "nvim-treesitter",
        config = function()
            require("Comment").setup {
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
             }
        end
     })
    use({
        "lukas-reineke/indent-blankline.nvim", -- Indentation lines
        event = "BufRead",
        config = function() require("plugins.indentline") end
     })

    --[[ use({
        "norcalli/nvim-colorizer.lua", -- Color highlight
        event = "CursorHold",
        config = function() require("colorizer").setup({ "*" }) end
     }) ]]

    use({
        "github/copilot.vim", -- Pair AI
        event = "InsertEnter"
     })
end)

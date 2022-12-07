-- Disable some default loaded plugins
require("config.loaded")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load plugins
require("config.basics")
require("config.keymaps")

if require("config.setup")() then
    return
end

-- Load catppuccin after the packer initialization
vim.schedule(function() vim.cmd("colorscheme catppuccin") end)

-- Packer config
return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    -----------------------------
    -------- Essentials ---------
    -----------------------------

    use("lewis6991/impatient.nvim") -- Impatient and StartupTime,
    use("dstein64/vim-startuptime") -- for my own curiosity.
    use("nvim-lua/plenary.nvim") -- Required by *
    use("kyazdani42/nvim-web-devicons") -- Fun icons (Great w/ Telescope)

    -----------------------------
    -------- Colorscheme --------
    -----------------------------

    --[[ use({
        "Yagua/nebulous.nvim", -- Cool alternative to material-gruvbox
        config = function()
            require("nebulous").setup({
                variant = "midnight"
             })
        end
     }) ]]

    use({
        "catppuccin/nvim", -- Colorscheme
        as = "catppuccin",
        config = function() require("plugins.catppuccin") end
     })

    -----------------------------
    -------- Treesitter ---------
    -----------------------------

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
        config = function() require("plugins.neoclip") end
     } })

    -----------------------------
    ----------- Misc ------------
    -----------------------------

    --[[ use({
        "nvim-lualine/lualine.nvim", -- Statusline
        after = "nvim-treesitter",
        config = function() require("plugins.lualine") end
     }) ]]

    use({
        "feline-nvim/feline.nvim",
        config = function() require("plugins.feline") end
     })

    use({
        "numToStr/Comment.nvim", -- Commenting plugin
        after = "nvim-treesitter",
        event = "CursorMoved",
        config = function() require("plugins.comment") end
     })
    use({
        "lukas-reineke/indent-blankline.nvim", -- Indentation lines
        event = "BufReadPost",
        config = function() require("plugins.indentline") end
     })
    use({
        "gbprod/cutlass.nvim", -- Correct delete copying
        event = "BufRead",
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
        config = function() vim.api.nvim_set_keymap("n", "<leader>cc", "<cmd>call inyoface#toggle_comments()<CR>", {}) end
     })

    -----------------------------
    ----------- Git -------------
    -----------------------------

    use({
        "lewis6991/gitsigns.nvim", -- Git mods highlight
        config = function() require("gitsigns").setup() end
     })

    -----------------------------
    ----------- LSP -------------
    -----------------------------

    use("neovim/nvim-lspconfig")
    use("simrat39/inlay-hints.nvim")
    use("j-hui/fidget.nvim")

end)

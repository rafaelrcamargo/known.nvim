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
        config = function() require("bufferline").setup() end,
        event = "BufWinEnter"
     })
    use({
        "nvim-tree/nvim-tree.lua",
        tag = "nightly",
        cmd = "NvimTreeToggle",
        config = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            require("nvim-tree").setup()
        end
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
        config = function()
            require("neodim").setup({
                alpha = 0.5,
                blend_color = "#000000",
                update_in_insert = {
                    enable = true,
                    delay = 100
                 }
             })
        end
     })

    -----------------------------
    --------- Completion --------
    -----------------------------

    use({ {
        "ms-jpq/coq_nvim",
        branch = "coq",
        event = "InsertEnter",
        setup = function()
            vim.g.coq_settings = {
                auto_start = "shut-up",
                completion = {
                    always = false
                 },
                keymap = {
                    pre_select = true,
                    recommended = false,
                    manual_complete_insertion_only = true
                 },
                display = {
                    ghost_text = {
                        enabled = false
                     },
                    pum = {
                        kind_context = { "  ", "" },
                        source_context = { "  ", "" }
                     },
                    preview = {
                        border = { { "", "NormalFloat" }, { "", "NormalFloat" }, { "", "NormalFloat" }, { " ", "NormalFloat" }, { "", "NormalFloat" }, { "", "NormalFloat" }, { "", "NormalFloat" }, { " ", "NormalFloat" } }
                     },
                    icons = {
                        mode = "short"
                     }
                 }
             }
        end
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
        config = function()
            require("coq_3p") { {
                src = "nvimlua",
                short_name = "LUA"
             }, {
                src = "copilot",
                short_name = "COP",
                accept_key = "<tab>"
             } }
        end
     } })
end)

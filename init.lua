-- Disable some builtin vim plugins
local disabled_built_ins = {"2html_plugin", "getscript", "getscriptPlugin", "gzip", "logipat", "matchit", "matchparen",
                            "netrw", "netrwFileHandlers", "netrwPlugin", "netrwSettings", "rrhelper", "tar",
                            "tarPlugin", "vimball", "vimballPlugin", "zip", "zipPlugin"}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- Do not source the default filetype.vim
vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1 -- Useful for replacing old .vim

-- Impatient + Profiling mode
require('impatient').enable_profile()

-- Load plugins
require('basics')
require('colors')
require('telescope-config')
require('coc-config')

-- Load treesitter
require('nvim-treesitter.configs').setup {
    ensure_installed = "all",
    ignore_install = {"phpdoc"},
    context_commentstring = {
        enable = true
    },
    highlight = {
        enable = true,
        disable = {"lua"}
    },
    indent = {
        enable = true
    }
}

-- Packer config
return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'dstein64/vim-startuptime'
    -- use 'nathom/filetype.nvim'
    use 'lewis6991/impatient.nvim'
    use 'sainnhe/gruvbox-material'
    use {
        'neoclide/coc.nvim',
        branch = 'release'
    }
    use 'nvim-treesitter/nvim-treesitter'
    use 'tpope/vim-commentary'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'lukas-reineke/indent-blankline.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        requires = {{
            'nvim-lua/plenary.nvim',
            after = 'telescope.nvim'
        }, {
            "nvim-telescope/telescope-file-browser.nvim",
            after = "telescope.nvim"
        }}
    }
    use {
        "ur4ltz/surround.nvim",
        config = function()
            require"surround".setup {
                mappings_style = "surround"
            }
        end
    }
end)

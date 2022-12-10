local M = {}

-- Setup nvim-treesitter.install
function M.install()
    require("nvim-treesitter.install").update({
        with_sync = true
     })()
end

-- Setup nvim-treesitter.configs
function M.config()
    require("nvim-treesitter.configs").setup({
        auto_install = true,
        ensure_installed = { "html", "css", "javascript", "typescript", "json", "yaml", "lua", "bash", "python", "c", "cpp", "rust", "go" },
        highlight = {
            enable = true, -- Enable highlighting for all files
            additional_vim_regex_highlighting = false
         },
        indent = {
            enable = true
         },
        -- windwp/nvim-ts-autotag
        autotag = {
            enable = true
         },
        -- numToStr/Comment.nvim
        context_commentstring = {
            enable = true,
            enable_autocmd = false
         },
        -- p00f/nvim-ts-rainbow
        rainbow = {
            enable = true,
            extended_mode = false,
            max_file_lines = 500,
            colors = { "#d8a657", "#e78a4e", "#ea6962", "#d3869b", "#7daea3", "#89b482", "#a9b665" }
         }
     })
end

return M

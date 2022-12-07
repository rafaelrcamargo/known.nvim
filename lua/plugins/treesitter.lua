require("nvim-treesitter.configs").setup {
    auto_install = true,
    ensure_installed = "all",
    ignore_install = { "phpdoc", "agda", "beancount", "bibtex", "blueprint", "clojure", "commonlisp", "cooklang", "cuda", "devicetree", "ebnf", "elvish", "erlang", "fennel", "gdscript", "godot-resource", "jq", "lalrpop", "latex", "ledger", "m68k", "menhir", "meson", "ninja", "norg", "rasi", "racket", "rnoweb", "slint", "sparql", "vala", "verilog", "wgsl", "yang" },
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
 }

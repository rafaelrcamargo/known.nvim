require("indent_blankline").setup({
    show_current_context = true,
    show_current_context_start = true,
    buftype_exclude = {
        "terminal",
        "nofile"
     },
    filetype_exclude = {
        "help",
        "packer",
        "dashboard"
     }
 })

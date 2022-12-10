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

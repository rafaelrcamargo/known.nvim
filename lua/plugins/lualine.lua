require("lualine").setup({
    options = {
        section_separators = "",
        component_separators = "",
        theme = "gruvbox-material",
        disabled_filetypes = {
            "dashboard",
            "packer"
         }
     },
    sections = {
        lualine_a = {
            "mode"
         },
        lualine_b = {
            "branch"
         },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {
            {
                "filetype",
                icon_only = true,
                padding = {
                    right = 0,
                    left = 1
                 }
             },
            {
                "filename",
                path = 1
             }
         },
        lualine_z = {
            {
                "location",
                padding = {
                    right = 1,
                    left = 0
                 }
             }
         }
     }
 })

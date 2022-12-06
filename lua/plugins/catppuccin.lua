require("catppuccin").setup({
    transparent_background = true,
    integrations = {
        ts_rainbow = false
     },
    color_overrides = {
        all = {
            rosewater = "#ddc7a1",
            flamingo = "#ddc7a1",
            pink = "#d3869b",
            mauve = "#ea6962",
            red = "#ea6962",
            maroon = "#ddc7a1",
            peach = "#a9b665",
            yellow = "#d8a657",
            green = "#d8a657", -- Function calls
            teal = "#89b482",
            sky = "#e78a4e", -- Operators
            sapphire = "#a9b665",
            blue = "#a9b665",
            lavender = "#ddc7a1",

            text = "#ddc7a1",

            subtext1 = "#a89984",
            subtext0 = "#928374",

            overlay2 = "#7c6f64",
            overlay1 = "#504945",
            overlay0 = "#d4be98",

            surface2 = "#a89984",
            surface1 = "#928374",
            surface0 = "#7c6f64",

            base = "#504945",
            mantle = "#3c3836",
            crust = "#282828"
         }
     },
    custom_highlights = {
        ["@tag"] = {
            fg = "#e78a4e"
         }, -- Tags like html tag names.
        ["@tag.attribute"] = {
            fg = "#e78a4e"
         }, -- Tags like html tag names.
        ["@tag.delimiter"] = {
            fg = "#928374"
         }, -- Tag delimiter like < > /
        ["@tag.attribute.tsx"] = {
            fg = "#a9b665"
         }, -- Tags like html classnames.
        ["@constructor.tsx"] = {
            fg = "#e78a4e"
         } -- TSX tags.
     }
 })

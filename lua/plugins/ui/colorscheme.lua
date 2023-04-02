local M = {}

function M.catppuccin()
  require("catppuccin").setup {
    transparent_background = true,
    color_overrides = {
      mocha = {
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

        subtext1 = "#847567",
        subtext0 = "#847567",

        overlay2 = "#847567",
        overlay1 = "#847567",
        overlay0 = "#847567",

        surface2 = "#847567",
        surface1 = "#504945",
        surface0 = "#504945",

        base = "#504945",
        mantle = "#282828",
        crust = "#282828",
      },
    },
    custom_highlights = {
      ["@tag"] = {
        fg = "#e78a4e",
      }, -- Tags like html tag names.
      ["@tag.attribute"] = {
        fg = "#e78a4e",
      }, -- Tags like html tag names.
      ["@tag.delimiter"] = {
        fg = "#847567",
      }, -- Tag delimiter like < > /
      ["@tag.attribute.tsx"] = {
        fg = "#a9b665",
      }, -- Tags like html classnames.
      ["@constructor.tsx"] = {
        fg = "#e78a4e",
      }, -- TSX tags.
      NonComment = {
        fg = "#504945",
      }, -- InYoFace non comment syntax.
      Visual = {
        bg = "#504945",
        style = {},
      },
    },
  }

  vim.cmd "silent! CatppuccinCompile"
end

return M

-- Change tabs
vim.api.nvim_set_keymap("n", "<TAB>", ":BufferLineCycleNext<CR>", {
    noremap = true,
    silent = true
 })

require("bufferline").setup()

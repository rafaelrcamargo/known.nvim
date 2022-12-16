local M = {}

function M.setup() vim.keymap.set("n", "<leader>r", "<cmd>RunCode<CR>", { noremap = true, silent = false }) end

function M.config()
  require("code_runner").setup {
    -- put here the commands by filetype
    filetype = {
      python = "python3 $fileName",
      lua = "lua $fileName",
      c = "gcc $fileName -o $fileNameWithoutExt && $fileNameWithoutExt",
      sh = "bash $fileName",
      rust = "cargo run",
      ocaml = "ocaml $fileName",
      typescript = "tsc $fileName && node ${fileNameWithoutExt}.js",
      javascript = "node $fileName",
      go = "go run $fileName",
    },
  }
end

return M

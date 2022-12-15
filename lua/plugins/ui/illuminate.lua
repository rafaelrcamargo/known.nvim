local M = {}

function M.config() require("illuminate").configure { delay = 300 } end

function M.setup()
  vim.cmd [[
    hi def IlluminatedWordText gui=nocombine guibg=#504945
    hi def IlluminatedWordRead gui=nocombine guibg=#504945
    hi def IlluminatedWordWrite gui=nocombine guibg=#504945
  ]]
end

return M

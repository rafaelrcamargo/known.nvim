local fn = vim.fn

local download_packer = function()
  if fn.input "Download Packer? [y/n]" ~= "y" then
    return
  end

  local directory = string.format("%s/site/pack/packer/start/", fn.stdpath "data")

  fn.mkdir(directory, "p")

  local out = fn.system(
    string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", directory .. "/packer.nvim")
  )

  print "Downloading packer.nvim..."
  print(out)
  print "You'll need to restart now"

  vim.cmd [[qa]]
end

return function()
  if not pcall(require, "packer") then
    download_packer()
    return true
  end
  return false
end

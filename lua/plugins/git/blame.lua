return function()
  vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
  vim.g.gitblame_message_when_not_committed = ""
  vim.g.gitblame_message_template = "<author> • <date> • <summary>"
  vim.g.gitblame_date_format = "%r"
end

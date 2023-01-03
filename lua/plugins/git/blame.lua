local g = vim.g
return function()
  g.gitblame_display_virtual_text = 0 -- Disable virtual text
  g.gitblame_message_when_not_committed = ""
  g.gitblame_message_template = "<author> • <date> • <summary>"
  g.gitblame_date_format = "%r"
end

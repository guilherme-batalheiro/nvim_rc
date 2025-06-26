vim.keymap.set("n", "<leader>gg", function()
  vim.ui.input({ prompt = "git " }, function(input)
    if input and #input > 0 then
      vim.cmd("Git " .. input)
    end
  end)
end, { desc = "Git with prompt" })



vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Center the screen 
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Center the word
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- NOTES
vim.keymap.set("n", "<leader>nn", ":!cat /tmp/notes.txt <cr>")
vim.keymap.set("n", "<leader>ne", ":e /tmp/notes.txt <cr>")




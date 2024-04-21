vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- List all register content
vim.keymap.set("n", "<leader>rl", ":reg<CR>")

-- Center the screen
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Center the word
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Copy
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")


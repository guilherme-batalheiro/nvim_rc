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

-- Shortcuts
vim.keymap.set("n", "<leader>sc", ":ShowShortcuts<CR>")

vim.keymap.set("n", "<leader>cp",
    function()
        vim.fn.setreg('+', vim.fn.expand('%:p'))
    end, { desc = 'Copy file path' }
)

vim.keymap.set("n", "<leader>cf",
    function()
        vim.fn.setreg('+', vim.fn.expand('%:t'))
    end, { desc = 'Copy file name' }
)


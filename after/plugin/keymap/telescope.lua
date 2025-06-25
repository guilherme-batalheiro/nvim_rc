local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fcc', builtin.live_grep, {})

-- edit neovim
vim.keymap.set('n', '<leader>en', function()
    require('telescope.builtin').find_files {
        cwd = vim.fn.stdpath("config")
    }
end)

local telescope = require("telescope")
telescope.setup({
    pickers = {
        live_grep = {
            file_ignore_patterns = { 'node_modules', '.git', '.venv' },
            additional_args = function(_)
                return { "--hidden" }
            end
        },
        find_files = {
            file_ignore_patterns = { 'node_modules', '.git', '.venv' },
            hidden = true
        }
    },
})

vim.keymap.set("n", "<space>ft", ":Telescope file_browser<CR>")
vim.keymap.set("n", "<leader>fc", function()
  require("telescope").extensions.live_grep_args.live_grep_args({
    additional_args = function(args)
      return { "--hidden" }
    end,
  })
end, {})

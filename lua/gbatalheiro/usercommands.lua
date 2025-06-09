vim.api.nvim_create_user_command("ShowShortcutsNotes", function()
    local lines = {
        "Shortcuts:",
        "",
        "   Telescope:",
        "<C-q>              - Send all to quickfix",
        "<M-q>              - Send selected to quickfix",
        "<C-r><C-w>         - Insert cword into prompt",
        "<C-r><C-a>         - Insert cWORD into prompt",
        "<C-r><C-f>         - Insert cfile into prompt",
        "<C-r><C-l>         - Insert cline into prompt",
        "   Debugger:",
        "<F4>               - Step out",
        "<F5>               - Step in",
        "<F6>               - Continue",
        "<leader>b          - Toggle breakpoin",
        "<leader>B          - Set brepoint with condition",
        "<leader>dr         - Toggle dap ui",
    }

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    local width = 60
    local height = #lines
    local opts = {
        relative = 'editor',
        width = width,
        height = height,
        row = (vim.o.lines - height) / 2 - 1,
        col = (vim.o.columns - width) / 2,
        style = 'minimal',
        border = 'rounded',
        focusable = false,
        noautocmd = true
    }

    local win = vim.api.nvim_open_win(buf, false, opts)

    vim.bo[buf].buftype = 'nofile'
    vim.bo[buf].bufhidden = 'wipe'
    vim.bo[buf].modifiable = false

    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "BufLeave"},
    {
        once = true,
        callback = function()
            if vim.api.nvim_win_is_valid(win) then
                vim.api.nvim_win_close(win, true)
            end
        end,
    }
)
end, {})


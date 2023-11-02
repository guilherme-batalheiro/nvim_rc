local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

require("dapui").setup({
    layouts = {
        {
            elements = {
                "breakpoints",
                "scopes",
                "watches",
            },
            size = 30,
            position = "left",
        },
        {
            elements = {
                "repl",
                "console",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
        },
    },
})

dap = require 'dap'

-- C and Cpp
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = vim.env.HOME .. '/.local/share/nvim/mason/bin/OpenDebugAD7',
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
    },
}

dap.configurations.c = dap.configurations.cpp

-- C#
dap.adapters.coreclr = {
    id = 'netcoredbg',
    type = 'executable',
    command = vim.env.HOME .. '/.local/share/nvim/mason/bin/netcoredbg',
    args = { '--interpreter=vscode' }
}

dap.configurations.cs = {
    {
        name = "launch - netcoredbg",
        type = "coreclr",
        request = "launch",
        program = function()
            return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end,
    },
}

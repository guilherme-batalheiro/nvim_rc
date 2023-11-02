require('neorg').setup {
    load = {
        ["core.defaults"] = {},  -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = {      -- Manages Neorg workspaces
            config = {
                workspaces = {
                    neorg = "~/Documents/neorg"
                },
                default_workspace = "neorg",
            },
        },
    },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.norg" },
    command = "set conceallevel=3"
})

vim.g.maplocalleader = ","

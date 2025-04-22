local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Theme
    "folke/tokyonight.nvim",

    -- Lsp support
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",

    -- Autocompletion
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",

    -- Snippets
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",

    -- Auto close
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },

    -- Treesitter
    "nvim-treesitter/nvim-treesitter",

    -- Telescope
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",

    -- DAP
    "mfussenegger/nvim-dap",
    {
        "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
    },
})

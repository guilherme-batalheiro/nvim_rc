-- Set up nvim-cmp.
local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')

lspconfig.clangd.setup { -- C and C++
    capabilities = capabilities,
}

lspconfig.gopls.setup { -- GO
    capabilities = capabilities,
}

lspconfig.pyright.setup { -- Python
    capabilities = capabilities,
}

lspconfig.lua_ls.setup { -- Lua
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    'vim',
                    'require'
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    }
}

lspconfig.tsserver.setup { -- TypeScript and JavaScript
    capabilities = capabilities,
}

lspconfig.html.setup { -- HTML
    capabilities = capabilities,
}

lspconfig.bashls.setup { -- Bash
    capabilities = capabilities,
}

-- Disable inline errors
vim.diagnostic.config({ virtual_text = false })

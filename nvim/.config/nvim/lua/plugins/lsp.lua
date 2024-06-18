return {
    {
        'williamboman/mason.nvim',
        dependencies = {
            'williamboman/mason-lspconfig.nvim'
        },
        config = function ()

            require('mason').setup({

            })

            require('mason-lspconfig').setup({
                ensure_installed = {
                    'lua_ls',
                    'basedpyright'
                },
                automatic_installation = true,
            })

        end
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            { 'antosha417/nvim-lsp-file-operations', config = true }
        },
        -- event = { "BufReadPre", 'BufNewFile' },
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require('lspconfig')

            -- local signs = { Error = ' ', Warn = ' ', Hint = " ", Info = ' ' }

            ---@diagnostic disable-next-line: unused-local
            local on_attach = function(client, bufnr)
                local opts = {}
                opts.buffer = bufnr
                vim.keymap.set('n', 'go', vim.lsp.buf.hover, opts)
                -- vim.keymap.set('n', 'gR', vim.cmd('Telescope lsp_refrences'), opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<Leader>c', vim.lsp.buf.code_action, opts)
            end

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            })
            lspconfig.omnisharp.setup({
                capabilities = capabilities,
                on_attach = on_attach
            })
            lspconfig.basedpyright.setup({
                capabilities = capabilities,
                on_attach = on_attach
            })

        end
    }
}

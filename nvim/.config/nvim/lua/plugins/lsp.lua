return {
    {
        'williamboman/mason.nvim',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim'
        },
        config = function ()

            require('mason').setup({

            })

            require('mason-tool-installer').setup({
                ensure_installed = {
                    'java-debug-adapter',
                    'java-test'
                }
            })

            vim.api.nvim_command('MasonToolsInstall')

            require('mason-lspconfig').setup({
                ensure_installed = {
                    'lua_ls',
                    'basedpyright',
                    'jdtls',
                    'clojure_lsp',
                },
                automatic_installation = true,
            })

            -- require('mason-lspconfig').setup_handlers({
            --     function(server_name)
            --         lspconfig[server_name].setup({
            --             on_attach = lsp_attach,
            --             capabilities = capabilities
            --         })
            --     end
            -- })

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

            local on_attach = function(client, bufnr)
                local opts = {}
                opts.buffer = bufnr
                vim.keymap.set('n', 'go', vim.lsp.buf.hover, opts)
                -- vim.keymap.set('n', 'gR', vim.cmd('Telescope lsp_refrences'), opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<Leader>c', vim.lsp.buf.code_action, opts)
            end


            vim.lsp.set_log_level("debug")

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
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
            lspconfig.jdtls.setup({
                capabilities = capabilities,
                on_attach = on_attach
            })
            lspconfig.clojure_lsp.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                cmd = { "clojure-lsp" },
                filetypes = { "clojure", "clojurescript", "clojurec" }
            })
            lspconfig.basedpyright.setup({
                capabilities = capabilities,
                on_attach = on_attach
            })

        end
    }
}

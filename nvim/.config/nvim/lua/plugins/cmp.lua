return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            -- 'tzachar/cmp-fuzzy-buffer',
            -- 'tzachar/fuzzy.nvim',

            'hrsh7th/cmp-cmdline',
            'dmitmel/cmp-cmdline-history',
            'tamago324/cmp-zsh',
            'rafamadriz/friendly-snippets'
        },
        config = function()

            local cmp = require('cmp')

            require('luasnip.loaders.from_vscode').lazy_load()

            local ls = require('luasnip')
            ls.config.set_config {
                history = true,
                updateevents = 'TextChanged,TextChangedI',
                enable_autosnippets = true,

                vim.keymap.set({ 'i', 's'}, "<C-k>", function ()
                    if ls.expand_or_jumpable() then
                        ls.expand_or_jump()
                    end
                end, {silent = true}),

                vim.keymap.set({ 'i', 's'}, "<C-j>", function ()
                    if ls.jumpable(-1) then
                        ls.jump(-1)
                    end
                end, {silent = true}),

                vim.keymap.set({ 'i', 's'}, "<C-l>", function ()
                    if ls.choice_active() then
                        ls.change_choice(1)
                    end
                end),

                vim.keymap.set('n', '<Leader><Leader>s', ':source ~/.config/nvim/lua/snippets.lua<CR>')

            }

            cmp.setup({

                -- completion = {
                --     completeopt = 'menu,menuone,preview, noselect'
                -- },

                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },

                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.confirm({ select = true })
                }),

                sources = cmp.config.sources(
                    {
                        { name = 'nvim_lsp' },
                        { name = 'luasnip' },
                        { name = 'buffer' },
                        -- { name = 'fuzzy_buffer' },
                        { name = 'path' }
                    },
                    {
                        { name = 'cmdline' },
                        { name = 'zsh' }
                    }
                )

            })
        end
    }
}

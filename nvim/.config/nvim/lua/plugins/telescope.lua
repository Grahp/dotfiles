return {
    {

        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            'nvim-tree/nvim-web-devicons'
        },

        config = function()
            local telescope_builtin = require('telescope.builtin')
            local actions = require('telescope.actions')

            -- Define the key mappings
            vim.keymap.set('n', '<Leader>u', function()
                -- Use find_files picker with file preview
                telescope_builtin.find_files({
                    results_title = false,
                    attach_mappings = function(_, map)
                        -- Enable preview on select
                        map('i', '<CR>', actions.select_default)
                        map('n', '<CR>', actions.select_default)
                        return true
                    end
                })
            end, {})

            vim.keymap.set('n', '<Leader>e', function()
                -- Use live_grep picker without file picker or preview
                telescope_builtin.live_grep({
                    results_title = false, -- Hide results title
                    previewer = false,     -- Disable previewer
                    attach_mappings = function(_, map)
                        -- Close telescope when selecting a line
                        map('i', '<CR>', actions.select_default)
                        map('n', '<CR>', actions.select_default)
                        return true
                    end
                })
            end, {})

            vim.keymap.set('n', '<Leader>f', function()
                telescope_builtin.grep_string({
                    results_title = false,
                    previewer = false,
                    attach_mappings = function(_, map)
                        map('i', '<CR>', actions.select_default)
                        map('n', '<CR>', actions.select_default)
                        return true
                    end
                })
            end, {})


            require('telescope').load_extension("fzf")
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require('telescope').setup {
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown {}
                    }
                }
            }
            require('telescope').load_extension('ui-select')
        end
    }
}

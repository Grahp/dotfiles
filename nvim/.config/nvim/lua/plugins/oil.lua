return {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
            show_hidden = true,
            is_always_hidden = function(name, bufnr)
                return name == '..' or name == '.' or name == '.git'
            end
        },
        columns = {
            'icon',
            -- 'size'
        },
        buf_options = {
            bufhidden = 'hide'
        },
        keymaps = {
            -- Go up dir
            ['<BS>'] = 'actions.parent'
        },
        float = {
            padding = 4
        },

    },
    keys = {
        { '<Leader>n', vim.cmd.Oil }
    }
}

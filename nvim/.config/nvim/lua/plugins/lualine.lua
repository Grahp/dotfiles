return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'folke/noice.nvim'
    },
    opts = {

        options = {
            theme = 'dracula'
        },
        sections = {
            lualine_a = {
                'filename'
            },
            lualine_c = {},
            lualine_y = {},
            lualine_x = {'filetype'},
        }

    }
}

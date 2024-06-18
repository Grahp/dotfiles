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
            -- lualine_y = {
            --     require("noice").api.statusline.mode.get,
            --     cond = require("noice").api.statusline.mode.has,
            --     color = { fg = "#ff9e64" },
            -- },
            lualine_x = {'filetype'},
        }

    }
}

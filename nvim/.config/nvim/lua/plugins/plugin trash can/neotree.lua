return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },

    keys = {

        {"<Leader>n", ':Neotree position=float<CR>'}

    },

    opts = {

        event_handlers = {
            {
                event = "neo_tree_buffer_enter",
                handler = function(arg)
                    vim.cmd [[
                    setlocal relativenumber
                    ]]
                end,
            },
        },
        filesystem = {
            filtered_items = {
                visible = true,
                show_hidden_count = true,
                hide_dotfiles = false,
                never_show = {},
            },
        },
        close_if_last_window = true,
        popup_border_style = "rounded",
        default_component_configs = {
            indent = {
                last_indent_marker = "╰",
            },
            icon = {
                folder_closed = "󰉋",
                folder_open = "󰝰",
                folder_empty = "󱧸",
                default = "󰡯",
            },
            modified = {
                symbol = "󰆓",
            }
        }

    }
}

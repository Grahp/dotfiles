return {
    'folke/noice.nvim',
    dependencies = {
        'MunifTanjim/nui.nvim'
    },
    opts = {
        presets = {
            bottom_search = true,
        },
        cmdline = {
            enabled = true,
            view = "cmdline",
            format = {
                search_down = { kind = "search", pattern = "^/", icon = "", lang = "regex" },
                search_up = { kind = "search", pattern = "^%?", icon = "", lang = "regex" },
                cmdline = { pattern = "^:", icon = "", lang = "vim" },
                lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = " lua", lang = "lua" },
                help = { pattern = "^:%s*disabled", icon = "" },
                visual = { pattern = "^:'<,'>", icon = "󰍜", lang = "vim" }
            }
        },
        routes = {
            {
                filter = {
                    view = "notify",
                    event = "msg_showmode"
                },
                opts = {
                    skip = false
                }
            },
            {
                filter = {
                    event = "msg_show",
                    kind = "search_count",
                },
                opts = { skip = true },
            }
        }
    },
}

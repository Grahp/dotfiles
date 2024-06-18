-- Fuck you vim
return {
    'willothy/moveline.nvim',
    build = 'make',
    config = function()
        local moveline = require('moveline')
        vim.keymap.set('n', '<M-k>', moveline.up)
        vim.keymap.set('n', '<M-j>', moveline.down)
        vim.keymap.set('v', 'K', moveline.block_up)
        vim.keymap.set('v', 'J', moveline.block_down)
    end
}

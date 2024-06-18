return {
    'theprimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        local harpoon = require('harpoon')

        harpoon:setup()

        -- Keymaps
        vim.keymap.set("n", "<Leader>an", function() harpoon:list():add() end)
        vim.keymap.set("n", "<Leader>at", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        -- Go to the places
        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<Leader>h", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<Leader>s", function() harpoon:list():next() end)
    end
}

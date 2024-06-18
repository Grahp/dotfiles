-- Quartz-like Bindings in Vim
vim.keymap.set('n', 'U', '<C-r>')

vim.keymap.set('n', 'v', 'V')
vim.keymap.set('n', 'V', 'v')
vim.keymap.set('n', 'e', 'A')
vim.keymap.set('n', 'E', 'I')

vim.keymap.set('n', 'gw', 'e')
vim.keymap.set('n', 'gW', 'E')
vim.keymap.set('n', 'gb', 'ge')
vim.keymap.set('n', 'gB', 'gE')

vim.keymap.set('n', 'J', 'gj')
vim.keymap.set('n', 'K', 'gk')

-- vim.keymap.set('n', 'j', 'jzz')
-- vim.keymap.set('n', 'k', 'kzz')

vim.keymap.set('n', '<CR>', 'o<Esc>')
vim.keymap.set('n', '<S-CR>', 'O<Esc>')

vim.keymap.set({ 'n', 'v'}, 'gj', 'G')
vim.keymap.set({ 'n', 'v'}, 'gk', 'gg')

-- vim.keymap.set({ 'n', 'v', 'i' }, '<Up>', '<Nop>')
-- vim.keymap.set({ 'n', 'v', 'i' }, '<Down>', '<Nop>')
-- vim.keymap.set({ 'n', 'v', 'i' }, '<Left>', '<Nop>')
-- vim.keymap.set({ 'n', 'v', 'i' }, '<Right>', '<Nop>')

vim.keymap.set({ 'n', 'v' }, 'G', '<Nop>')
vim.keymap.set({ 'n', 'v' }, 'gg', '<Nop>')

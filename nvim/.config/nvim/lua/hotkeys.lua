-- Set Leader Key
vim.g.mapleader = ' '

vim.keymap.set('n', '<Leader>w', function()
    vim.cmd('silent w')
end)
vim.keymap.set('n', '<Leader>q', vim.cmd.q)
vim.keymap.set('n', '<Space>', '<Nop>')
vim.keymap.set('n', 'Q', '<Nop>')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set({ 'n', 'v' }, 'j', 'jzz')
vim.keymap.set({ 'n', 'v' }, 'k', 'kzz')

vim.keymap.set('v', '<Leader>y', function ()
    vim.cmd('norm! "+y')
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>p', function ()
    vim.cmd('norm! "+p')
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>d', function ()
    vim.cmd('norm! "+d')
end)

-- No clue why these need to be their own functions, but they don't work otherwise ._.
vim.keymap.set('n', 'u', function()
	vim.cmd('silent u')
end)
vim.keymap.set('n', 'U', function()
	vim.cmd('silent U')
end)

vim.keymap.set('n', '<Leader>t', '<C-^>')

vim.keymap.set('n', '<Leader>au', function ()
    vim.cmd('UndotreeToggle')
    vim.cmd('UndotreeFocus')
end)

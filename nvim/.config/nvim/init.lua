-- Lazy
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require('hotkeys')

require('lazy').setup({
    spec = 'plugins',
    change_detection = { notify = false }
})

require('options')
require('quartz')
require('markdown')

-- For init.lua
vim.api.nvim_command('augroup skript_syntax')
vim.api.nvim_command('autocmd!')
vim.api.nvim_command('autocmd FileType skript source ~/.config/nvim/syntax/skript.vim')
vim.api.nvim_command('augroup END')

-- Define an autocmd group
vim.api.nvim_create_augroup('CustomFileTypeSettings', { clear = true })

-- Define an autocmd for .sk files
vim.api.nvim_create_autocmd('FileType', {
  group = 'CustomFileTypeSettings',
  pattern = 'skript',
  callback = function()
    vim.opt_local.commentstring = '# %s'
  end
})

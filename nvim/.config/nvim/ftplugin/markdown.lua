vim.opt.spelllang = 'en_us'
vim.opt.spell = true
vim.opt.wrap = true
vim.opt.linebreak = true
require('cmp').setup.buffer { enabled = false }

-- vim.cmd([[
--     augroup pandoc_syntax
--     au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
--     augroup END
-- ]])
--

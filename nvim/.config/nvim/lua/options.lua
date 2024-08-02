-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Idk, but kickstart said to do it, so it must be good
vim.g.have_nerd_font = true

-- Remove Line Wrapping
vim.opt.wrap = false

-- search nonsense
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Greatest setting ever
vim.opt.scrolloff = 19

-- Remove Vim Backups
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Reduce Update Time
vim.opt.updatetime = 250

-- Remove Sign Column
vim.opt.signcolumn = 'no'

-- Cursor baby
vim.opt.cursorline = true



-- Break Indent LETS GOOO
vim.opt.breakindent = true

vim.cmd([[hi TreesitterContextBottom none]])

-- function file_rules()
--
-- 	 local file_name = vim.fn.expand('%:t')
--
--      local function markdown()
-- 		 vim.opt.wrap = true
-- 		 vim.opt.linebreak = true
--          require('cmp').setup.buffer { enabled = false }
--      end
--
-- 	 if file_name:match('%.md$') then
--          markdown()
-- 	 end
--
-- 	 if file_name:match('%.txt$') then
--          markdown()
-- 	 end
--
-- 	 if file_name:match('%.qz$') then
--          markdown()
-- 	 end
-- end
--
-- -- Autocomand to trigger file_rules
-- vim.api.nvim_exec([[
-- 	augroup MyAutoCommands
-- 		autocmd!
-- 		autocmd BufReadPost * lua file_rules()
-- 	augroup END
-- ]], false)

vim.api.nvim_exec([[augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="visual", timeout=150, on_visual=false})
augroup END]], false)


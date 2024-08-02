-- return {
--     {
--         'plasticboy/vim-markdown',
--         dependencies = {
--             'godlygeek/tabular',
--             'elzr/vim-json'
--         },
--         config = function()
--             vim.cmd('let g:vim_markdown_folding_disabled = 1')
--             vim.cmd('let g:vim_markdown_conceal = 0')
--
--             vim.cmd('let g:tex_conceal = ""')
--             vim.cmd('let g:vim_markdown_math = 1')
--
--             vim.cmd('let g:vim_markdown_frontmatter = 1')
--             vim.cmd('let g:vim_markdown_toml_frontmatter = 1')
--             vim.cmd('let g:vim_markdown_json_frontmatter = 1')
--         end
--     },
--     {
--         'https://github.com/vim-pandoc/vim-pandoc-syntax',
--     }
-- }
return {
    "tadmccorkle/markdown.nvim",
    ft = "markdown",
    opts = {

    }
}

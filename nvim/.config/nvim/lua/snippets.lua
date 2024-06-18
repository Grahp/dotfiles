-- Import LuaSnip
local ls = require('luasnip')

-- Define your snippet
local my_snippet = ls.parser.parse_snippet({
    trig = "hello", -- Trigger for the snippet
    dscr = "Simple hello world snippet", -- Description (optional)
    -- Snippet definition
    wordTriggers = true,
    -- The actual snippet body
    name = "HelloSnippet",
    body = "Hello, world!",
})

-- Register your snippet
ls.add_snippets({
  all = {
    my_snippet
  }
})


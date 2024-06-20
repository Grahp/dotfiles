vim.keymap.set('n', '<Leader>oa', ':lua addNewTask()<CR>')

vim.keymap.set('n', '<Leader>oe', ':lua addNewEvent()<CR>')

vim.keymap.set('n', '<Leader>oi', ':lua addNewDone()<CR>')

vim.keymap.set('n', '<Leader>od', ':lua addNewFood()<CR>')

vim.keymap.set('n', '<Leader>ot', function()

    local line = vim.fn.getline(vim.fn.line('.'))
    local checked = string.match(line, '%[[xX]-%]') ~= nil

    if checked then

        -- Remove the Time
        local pattern = "(.-) %*%*(.-)%*%*(.*)"
        local new_line = string.gsub(line, pattern, "%1%3", 1)

        new_line = string.gsub(new_line, "%[x%]", "[ ]")
        vim.api.nvim_set_current_line(new_line)

        return

    end

    local time = get_time()
    local cursor_pos = vim.fn.getpos('.')

    -- Tick the checkbox and add the time
    vim.cmd('exec "norm! _t]rxwa **' .. time .. '**"')

    -- Set Cursor to previous position
    vim.fn.setpos('.', cursor_pos)

end)



vim.keymap.set('n', '<Leader>ost', function()

    local line = vim.fn.getline(vim.fn.line('.'))
    local checked = string.match(line, '%[[xX]-%]') ~= nil

    if checked then

        new_line = string.gsub(new_line, "%[x%]", "[ ]")
        vim.api.nvim_set_current_line(new_line)

        return

    end

    new_line = string.gsub(new_line, "%[ %]", "[x]")
    vim.api.nvim_set_current_line(new_line)

end)







vim.keymap.set('n', '<Leader>on', function()

    local time = get_time()

    local cursor_pos = vim.fn.getpos('.')
    local search_result = vim.fn.search('# Food', 'n')

    if search_result ~= 0 then

        vim.fn.setpos('.', cursor_pos)
        vim.cmd(search_result .. 'norm! kk')
        vim.cmd('exec "norm o- **' .. time .. '** "')
        vim.cmd('startinsert!')

    end

end)
vim.keymap.set('n', '<Leader>oc', function()
    vim.cmd('norm! o- [ ] ')
    vim.cmd('startinsert!')
end)

-- Functions

function get_time()
    return os.date('%I:%M %p'):gsub('^0', '')
end

function new_checkbox() 
    vim.fn.feedkeys('o- [ ] ')
end

function toggleCheckbox()

    local lineNumber = vim.fn.line('.')
    local line = vim.fn.getline(lineNumber)

    local unchecked = string.match(line, '%[[ ]-%]') ~= nil
    local checked = string.match(line, '%[[xX]-%]') ~= nil

    if unchecked then
        local time = os.date('%I:%M %p'):gsub('^0', '')
        vim.fn.feedkeys('_t]rxwwi**' .. time .. '** ', 'n')
        vim.api.nvim_input('<Esc>')
        return
    end

    if checked then
        vim.fn.feedkeys('_t]r wwvWElx', 'n')
        return
    end

end

function insertTime()
        local time = os.date('%I:%M %p'):gsub('^0', '')
        vim.fn.feedkeys('i **' .. time .. '** ')
end

function addNewEvent()

    local time = os.date('%I:%M %p'):gsub('^0', '')
    vim.fn.feedkeys('/## Tasks\nkO- [ ] ', 'n')

end

function addNewTask()

    local time = os.date('%I:%M %p'):gsub('^0', '')
    vim.fn.feedkeys('/## Done\nkO- [ ] ', 'n')

end

function addNewFood()

    local time = os.date('%I:%M %p'):gsub('^0', '')
    vim.fn.feedkeys('/# Flaws\nkO- **' .. time .. '** ', 'n')

end

function addNewDone()

    local time = os.date('%I:%M %p'):gsub('^0', '')
    vim.fn.feedkeys('/# Notes\nkO- [x] **' .. time .. '** ', 'n')

end

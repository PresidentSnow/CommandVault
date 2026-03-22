-- Configuration of shortcuts
local api = vim.api.nvim_create_augroup
local apicmd = vim.api.nvim_create_autocmd

-- autocmd 'match'
-- vim.cmd([[
--   autocmd CursorHold * silent! exe 'match Search /\V\<'.escape(expand('<cword>'), '\').'\>/'
--   autocmd CursorMoved * silent! match none
-- ]])

-- API nvim
local augroup = api('HighlightWord', { clear = true })

apicmd('CursorHold', {
  group = augroup,
  callback = function()
    local word = vim.fn.expand('<cword>')
    if word ~= '' then
      vim.cmd('match Search /\\V\\<' .. word .. '\\>/')
    end
  end
})

apicmd('CursorMoved', {
  group = augroup,
  callback = function()
    vim.cmd('match none')
  end
})

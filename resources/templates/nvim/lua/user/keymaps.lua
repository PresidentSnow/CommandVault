-- Configuration of shortcuts                                                                                                                                                                
local map = vim.api.nvim_set_keymap                                                                                                                                                          
local opts = { noremap = true, silent = true }     

-- line numbers (Ctrl+s)     
map('n', '<C-s>', ':echo (line(\'$\') .. " lines")<CR>', opts)    

-- execute the script and gave execution permissions (F5)    
map('n', '<F5>', ':w<CR>:!chmod +x %:p && %:p<CR>', { noremap = true, silent = true })    

-- open new terminal (F8)        
map('n', '<F8>', ':split<CR>:terminal<CR>', opts)    

-- close terminal (Ctrl + F8)    
-- (these doesn't works...)                                                                                                                                                                     
map('n', '<C-F8>', ':bd!<CR>', opts)    
map('t', '<C-F8>', '<C-\\><C-n>:bd!<CR>', opts)    

-- Navigation in 'normal' mode    
map('n', '<C-h>', '<C-w>h', opts)    
map('n', '<C-j>', '<C-w>j', opts)    
map('n', '<C-k>', '<C-w>k', opts)    
map('n', '<C-l>', '<C-w>l', opts)    

-- Navigation in terminal mode    
map('t', '<C-h>', '<C-\\><C-n><C-w>h', opts)       
map('t', '<C-j>', '<C-\\><C-n><C-w>j', opts)       
map('t', '<C-k>', '<C-\\><C-n><C-w>k', opts)       
map('t', '<C-l>', '<C-\\><C-n><C-w>l', opts)
-- Miscellaneous
vim.cmd([[ nnoremap <C-a> <esc>ggVG<CR> ]]) -- Select all
vim.cmd([[ vnoremap <Leader>y "+y ]]) -- Copy to clipboard
vim.cmd([[ nnoremap <Leader>p "*p ]]) -- Paste from system clipboard
vim.cmd([[ nnoremap H <cmd>:w<CR> ]]) -- Quick save
vim.cmd([[ nnoremap Y y$ ]]) -- Copy until end of line

return {}

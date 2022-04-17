vim.g.wildmenu = true

-- update time for plugins (speed when they act)
vim.opt.updatetime = 300

-- set.relative line numbers for jumping
vim.opt.relativenumber = true

-- Number of current line
vim.opt.number = true

--Mouse support active. Alt click
vim.opt.mouse = "a"

-- Do not allow line wraping
vim.opt.wrap = false

-- Start scrolling when you're 15 away from bottom (and side)
vim.opt.scrolloff = 15
vim.opt.sidescrolloff = 35

-- Keep column for linting always on
vim.opt.signcolumn = "yes"

-- Search settings
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Create splits vertically by default
vim.opt.diffopt = "vertical"

-- set no swap files
vim.opt.swapfile = false
vim.opt.backup = false
-- And use undodir instead
-- Allow undo-ing even after save file
vim.opt.undodir = vim.fn.stdpath("config") .. "/.undo"
vim.opt.undofile = true

-- Indenting
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.cindent = true
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Plugins
vim.o.completeopt = "menu,menuone,noselect"  -- for nvim-cmp

-- Setup autopairs.
require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt" },
	enable_check_bracket_line = false,
})

-- Setup AirLine.
vim.cmd([[ let g:airline#extensions#tabline#enabled = 1 ]])
vim.cmd([[ let g:airline#extensions#tabline#formatter = 'default' ]])
vim.cmd([[ let g:airline_powerline_fonts = 1 ]])
vim.cmd([[ let g:airline#extensions#virtualenv#enabled = 1 ]])
vim.cmd([[ let g:airline#extensions#poetv#enabled = 1 ]])

vim.cmd([[
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
]])

vim.cmd([[ let g:airline_symbols.linenr = " :"]])
vim.cmd([[ let g:airline_symbols.maxlinenr = " Ξ "]])
vim.cmd([[ let g:airline_symbols.colnr = ":"]])
vim.cmd([[ let g:airline_theme = "transparent" ]])  -- to match tokyonight

-- Setup Telescope.
vim.cmd([[nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>]])
vim.cmd([[nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>]])
vim.cmd([[nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>]])
vim.cmd([[nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>]])

-- Setup FTerm.
vim.cmd([[ nnoremap <C-z> <cmd>lua require('FTerm').toggle()<cr> ]])
vim.cmd([[ tnoremap <C-z> <C-\><C-N><cmd>lua require('FTerm').toggle()<cr>]])

" Plugins section.

lua << EOF
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/autoload/plug.vim"

if fn.empty(fn.glob(install_path)) > 0 then
    print("vim-plug not installed.")
end
EOF

let g:plug_threads = 16
let g:plug_timeout = 60
let g:plug_retries = 2
let g:plug_window = "vertical topleft new"
let g:plug_pwindow = "above 12new"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lua', { 'for': 'lua' }
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }  " In colors.lua file
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim' | Plug 'nvim-lua/plenary.nvim'
Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
Plug 'numToStr/FTerm.nvim'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'windwp/nvim-autopairs'
Plug 'lewis6991/gitsigns.nvim' | Plug 'nvim-lua/plenary.nvim'
Plug 'p00f/nvim-ts-rainbow' | Plug 'nvim-treesitter/nvim-treesitter'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'sindrets/diffview.nvim' | Plug 'nvim-lua/plenary.nvim'
Plug 'petertriho/nvim-scrollbar'
Plug 'karb94/neoscroll.nvim'
Plug 'itchyny/vim-gitbranch'
Plug 'nvim-treesitter/nvim-treesitter', { 'on': ':TSUpdate' }
Plug 'nvim-treesitter/playground' | Plug 'nvim-treesitter/nvim-treesitter'
Plug 'lambdalisue/glyph-palette.vim'

set encoding=UTF-8

call plug#end()

" Load the colorscheme
lua require('colors')

" Load settings.
lua require('settings')

" Load mappings.
lua require('mappings')

" Load languages Server
lua require('lsp')

" Load plugins.
lua require('plugins')

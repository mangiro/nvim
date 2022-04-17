require'nvim-tree'.setup {
  filters = {
    dotfiles = false,
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 400,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
}

vim.cmd([[nnoremap <C-n> :NvimTreeToggle<CR>]])

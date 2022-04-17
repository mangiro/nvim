require("gitsigns").setup({
	signs = {
		add = {
			hl = "GitSignsAdd",
			numhl = "GitSignsAddNr",
			linehl = "GitSignsAddLn",
		},
		change = {
			hl = "GitSignsChange",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
		delete = {
			hl = "GitSignsDelete",
			numhl = "GitSignsDeleteNr",
			linehl = "GitSignsDeleteLn",
		},
		topdelete = {
			hl = "GitSignsDelete",
			numhl = "GitSignsDeleteNr",
			linehl = "GitSignsDeleteLn",
		},
		changedelete = {
			hl = "GitSignsChange",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	keymaps = {}, -- Turn off default keymaps
	watch_gitdir = { interval = 1000, follow_files = true },
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter_opts = { relative_time = false },
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = { enable = false },
})
-- Gitsigns w/ hunks and blames.
vim.cmd([[ nnoremap <leader>ga <cmd>:Gitsigns stage_hunk<CR>]])
vim.cmd([[ nnoremap <leader>gb <cmd>:Gitsigns blame_line<CR>]])
vim.cmd([[ nnoremap <leader>gp <cmd>:Gitsigns prev_hunk<CR>]])
vim.cmd([[ nnoremap <leader>gn <cmd>:Gitsigns next_hunk<CR>]])
vim.cmd([[ nnoremap <leader>gr <cmd>:Gitsigns reset_hunk<CR>]])
vim.cmd([[ nnoremap <leader>gd <cmd>:Gitsigns preview_hunk<CR>]])

vim.cmd("set termguicolors")
vim.cmd([[ :set signcolumn=yes ]])
vim.cmd([[ :hi NonText guifg=bg ]])
vim.cmd("set colorcolumn=80,120")

local tokyonight_ok = pcall(require, "tokyonight")
if not tokyonight_ok then
  print("Tokyonight is not installed.")
	return
end

vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_italic_variables = true
vim.g.tokyonight_transparent = false
vim.g.tokyonight_sidebars = { "terminal" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

vim.cmd[[colorscheme tokyonight]]

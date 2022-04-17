vim.cmd([[ nnoremap <leader>gs <cmd>lua require("plugins.fugitive").toggle_status()<cr>]])

return {
  toggle_status = function()
	  local ft = vim.bo.filetype
	  if ft == "fugitive" then
		  vim.api.nvim_command("bd")
	  else
		  vim.api.nvim_command("Git")
	  end
  end
}

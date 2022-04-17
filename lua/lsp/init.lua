local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local lsp_installer_status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

if not (cmp_nvim_lsp_status_ok and lsp_installer_status_ok) then
	print("LSPConfig, CMP_LSP, and/or LSPInstaller not installed!")
	return
end

-- Configure CMP
require("lsp.cmp")

-- Mappings
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Map keys after LSP attaches (utility function)
local on_attach = function(client, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	client.resolved_capabilities.document_formatting = false

	-- Debounce by 300ms by default
	client.config.flags.debounce_text_changes = 300

  -- Mappings
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp_installer.on_server_ready(function(server)
	local server_status_ok, server_config = pcall(require, "lsp.servers." .. server.name)
	if not server_status_ok then
		print("The LSP '" .. server.name .. "' does not have a config.")
		server:setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	else
		server_config.setup(on_attach, capabilities, server)
	end
end)

-- Global diagnostic settings
vim.diagnostic.config({
	virtual_text = true,
	severity_sort = true,
	update_in_insert = false,
	float = {
		header = "",
		source = "always",
		border = "rounded",
		focusable = true,
	},
})

-- Change Error Signs in Gutter
local signs = { Error = "✘", Warn = " ", Hint = "", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

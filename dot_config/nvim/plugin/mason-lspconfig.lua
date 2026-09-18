vim.pack.add({ "https://github.com/mason-org/mason-lspconfig.nvim" })
require("mason-lspconfig").setup({
	ensure_installed = {
		"basedpyright",
		"bashls",
		"buf_ls",
		"clangd",
		"cssls",
		"cssmodules_ls",
		"html",
		"lua_ls",
		"tombi",
		"vtsls",
		"yamlls",
	},
})

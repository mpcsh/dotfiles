return {
	"williamboman/mason-lspconfig.nvim",
	event = { "BufNewFile", "BufReadPost" },
	dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
	config = {
		ensure_installed = {
			"basedpyright",
			"bashls",
			"buf_ls",
			"clangd",
			"cssls",
			"css_variables",
			"html",
			"lua_ls",
			"ts_ls",
		},
	},
}

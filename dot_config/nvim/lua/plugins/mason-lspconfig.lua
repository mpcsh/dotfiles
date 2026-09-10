return {
	"mason-org/mason-lspconfig.nvim",
	event = { "BufNewFile", "BufReadPost" },
	dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
	opts = {
		ensure_installed = {
			"basedpyright",
			"bashls",
			"buf_ls",
			"clangd",
			"cssls",
			"cssmodules_ls",
			"html",
			"lua_ls",
			"vtsls",
		},
	},
}

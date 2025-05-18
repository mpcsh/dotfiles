return {
	"neovim/nvim-lspconfig",
	event = { "BufNewFile", "BufReadPost" },
	dependencies = {
		{
			"williamboman/mason-lspconfig.nvim",
			dependencies = { "williamboman/mason.nvim" },
		},
	},
}

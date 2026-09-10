return {
	"neovim/nvim-lspconfig",
	event = { "BufNewFile", "BufReadPost" },
	dependencies = {
		{
			"mason-org/mason-lspconfig.nvim",
			dependencies = { "mason-org/mason.nvim" },
		},
	},
}

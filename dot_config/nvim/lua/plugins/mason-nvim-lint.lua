return {
	"rshkarin/mason-nvim-lint",
	dependencies = { "mason-org/mason.nvim", "mfussenegger/nvim-lint" },
	event = { "BufNewFile", "BufReadPost" },
	opts = {},
}

return {
	"rshkarin/mason-nvim-lint",
	dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-lint" },
	event = { "BufNewFile", "BufReadPost" },
	opts = {},
}

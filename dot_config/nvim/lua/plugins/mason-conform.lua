return {
	"mpcsh/mason-conform",
	dependencies = { "williamboman/mason.nvim", "stevearc/conform.nvim" },
	event = { "BufNewFile", "BufReadPost" },
	opts = {},
}

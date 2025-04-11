return {
	"rgroli/other.nvim",
	main = "other-nvim",
	event = { "BufNewFile", "BufReadPost" },
	opts = {
		mappings = {
			"react",
			"rust",
			"python",
		},
	},
}

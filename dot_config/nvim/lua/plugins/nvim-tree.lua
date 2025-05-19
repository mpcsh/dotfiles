return {
	"nvim-tree/nvim-tree.lua",
	event = "UIEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{ [[<Leader>S]], [[<cmd>NvimTreeFindFileToggle<cr>]] },
	},
}

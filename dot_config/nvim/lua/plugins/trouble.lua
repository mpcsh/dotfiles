return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		modes = {
			diagnostics = {
				preview = {
					type = "split",
					relative = "win",
					position = "right",
					size = 0.5,
				},
			},
		},
	},
	cmd = "Trouble",
	keys = {
		{
			[[<Leader>T]],
			[[<cmd>Trouble diagnostics toggle focus=true win.position=bottom<cr>]],
			desc = "Quickfix List (Trouble)",
		},
	},
}

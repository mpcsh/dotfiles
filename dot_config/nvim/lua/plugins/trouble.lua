return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		modes = {
			diagnostics = {
				preview = {
					type = "split",
					relative = "win",
					position = "bottom",
					size = 0.5,
				},
			},
		},
	},
	cmd = "Trouble",
	keys = {
		{
			[[<Leader>T]],
			[[<cmd>Trouble diagnostics toggle focus=true win.position=right<cr>]],
			desc = "Quickfix List (Trouble)",
		},
	},
}

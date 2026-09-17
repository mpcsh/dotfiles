vim.pack.add({ "https://github.com/nvim-tree/nvim-web-devicons" })
vim.pack.add({ "https://github.com/folke/trouble.nvim" })
require("trouble").setup({
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
})
vim.keymap.set(
	"n",
	[[<Leader>T]],
	[[<cmd>Trouble diagnostics toggle focus=true win.position=bottom<cr>]],
	{ desc = "Quickfix List (Trouble)" }
)

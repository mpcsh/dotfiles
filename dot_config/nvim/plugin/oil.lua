-- vim.pack.add({ "https://github.com/echasnovski/mini.icons" })
vim.pack.add({ "https://github.com/nvim-tree/nvim-web-devicons" }) -- use if you prefer nvim-web-devicons
vim.pack.add({ "https://github.com/stevearc/oil.nvim" })
require("oil").setup({
	buf_options = {
		bufhidden = "",
		buflisted = true,
	},
	view_options = {
		natural_order = false,
		show_hidden = true,
	},
})

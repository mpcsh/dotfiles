return {
	"stevearc/oil.nvim",
	-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	opts = {
		buf_options = {
			bufhidden = "",
			buflisted = true,
		},
		natural_order = false,
		show_hidden = true,
	},
}

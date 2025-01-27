return {
	{ "lewis6991/gitsigns.nvim", event = "BufReadPre" },
	{
		"nvim-lualine/lualine.nvim",
		event = "BufReadPre",
		opts = {
			options = {
				theme = "catppuccin-mocha",
				component_separators = { left = "▓▒░", right = "░▒▓" },
				section_separators = { left = "▓▒░", right = "░▒▓" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "filename" },
				lualine_c = { "branch", "diff", "diagnostics" },
				lualine_x = { "" },
				lualine_y = { "filetype" },
				lualine_z = { "location" },
			},
		},
	},
	{ "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"wincent/terminus",
}

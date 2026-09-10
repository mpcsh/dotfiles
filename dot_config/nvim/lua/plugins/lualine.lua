return {
	"nvim-lualine/lualine.nvim",
	event = "UIEnter",
	opts = {
		options = {
			component_separators = { left = "▓▒░", right = "░▒▓" },
			section_separators = { left = "▓▒░", right = "░▒▓" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { { "filename", path = 1 } },
			lualine_c = {},
			lualine_x = {},
			lualine_y = { "filetype" },
			lualine_z = { "location" },
		},
	},
}

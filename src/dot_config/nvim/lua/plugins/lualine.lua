return {
	"nvim-lualine/lualine.nvim",
	event = "UIEnter", -- TODO: this prevents lualine from loading on a bare launch with no file
	-- TODO: ORRRR apparently lazy.nvim doesn't like symlinks?! As soon as I stowed `nvim` without `--no-folding` everything works?!
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
}

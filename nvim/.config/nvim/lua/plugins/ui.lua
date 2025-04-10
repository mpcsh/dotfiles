vim.opt.list = true
-- vim.opt.listchars = "tab:• ,trail:·"

-- require("ibl").setup()

vim.opt.cursorline = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
	{ "lewis6991/gitsigns.nvim", event = { "BufNewFile", "BufReadPost" }, opts = {} },
	{
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
	},
	{
		"nvim-tree/nvim-tree.lua",
		event = "UIEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		keys = {
			{ [[<Leader>S]], [[NvimTreeToggle]] },
		},
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},
	{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{
		"nvim-telescope/telescope.nvim",
		-- event = "UIEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			pickers = {
				find_files = {
					find_command = vim.split("fd --hidden --exclude .git/ -t f --strip-cwd-prefix", " "),
				},
			},
		},
		keys = {
			{ [[<Leader>\\]], [[Telescope lsp_definitions]] },
			{ [[<Leader>']], [[Telescope lsp_references]] },
			{ [[<Leader>"]], [[Telescope lsp_incoming_calls]] },
			{ [[<C-p>]], [[Telescope find_files]] },
			{ [[<C-k>]], [[Telescope]] },
		},
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "UIEnter",
		opts = {},
	},
	{
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
	},
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"wincent/terminus",
}

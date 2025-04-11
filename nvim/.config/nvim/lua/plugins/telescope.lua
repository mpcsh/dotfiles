return {
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
	cmd = "Telescope",
	keys = {
		{ [[<Leader>\\]], [[<cmd>Telescope lsp_definitions<cr>]] },
		{ [[<Leader>']], [[<cmd>Telescope lsp_references<cr>]] },
		{ [[<Leader>"]], [[<cmd>Telescope lsp_incoming_calls<cr>]] },
		{ [[<C-p>]], [[<cmd>Telescope find_files<cr>]] },
		{ [[<C-k>]], [[<cmd>Telescope<cr>]] },
	},
}

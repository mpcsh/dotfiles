return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		colorschemes = {
			ignore_patterns = {
				"^blue$",
				"^darkblue$",
				"^default$",
				"^delek$",
				"^desert$",
				"^elflord$",
				"^evening$",
				"^habamax$",
				"^industry$",
				"^koehler$",
				"^lunaperche$",
				"^morning$",
				"^murphy$",
				"^pablo$",
				"^peachpuff$",
				"^quiet$",
				"^retrobox$",
				"^ron$",
				"^shine$",
				"^slate$",
				"^sorbet$",
				"^torte$",
				"^vim$",
				"^wildcharm$",
				"^zaibatsu$",
				"^zellner$",
			},
		},
	},
	cmd = "FzfLua",
	keys = {
		{ [[<Leader>\]], [[<cmd>FzfLua lsp_definitions<cr>]] },
		{ [[<Leader>']], [[<cmd>FzfLua lsp_references<cr>]] },
		{ [[<Leader>"]], [[<cmd>FzfLua lsp_incoming_calls<cr>]] },
		{ [[<C-p>]], [[<cmd>FzfLua files<cr>]] },
		{ [[<C-k>]], [[<cmd>FzfLua<cr>]] },
	},
}

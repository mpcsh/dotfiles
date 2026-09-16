return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		buffers = {
			actions = {
				-- this allows closing the current buffer
				["ctrl-x"] = {
					fn = function(selected, opts)
						local path = require("fzf-lua.path")
						local snacks = require("snacks")
						for _, sel in ipairs(selected) do
							local entry = path.entry_to_file(sel, opts)
							if entry.bufnr then
								snacks.bufdelete({ buf = entry.bufnr, wipe = true })
							end
						end
					end,
					reload = true,
				},
			},
			fzf_opts = {
				-- this makes the current buffer selectable
				["--header-lines"] = false,
				-- this is required for the below to work
				["--sync"] = true,
			},
			keymap = {
				fzf = {
					-- this restores the original functionality of preselecting the next most recent buffer
					start = "pos(2)",
				},
			},
		},
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
		files = {
			fd_opts = "--color=never --type f --hidden --exclude .git",
		},
		grep = {
			rg_opts = "--line-number --column --hidden --smart-case --glob !.git",
		},
		lsp = {
			ignore_current_line = true,
			includeDeclaration = false,
		},
		winopts = {
			preview = {
				vertical = "down:40%",
				horizontal = "right:40%",
				flip_columns = 192,
			},
		},
	},
	cmd = "FzfLua",
	keys = {
		{ [[<Leader>\]], [[<cmd>FzfLua lsp_definitions<cr>]] },
		{ [[<Leader>']], [[<cmd>FzfLua lsp_references<cr>]] },
		{ [[<Leader>"]], [[<cmd>FzfLua lsp_incoming_calls<cr>]] },
		{ [[<C-p>]], [[<cmd>FzfLua files<cr>]] },
		{ [[<C-b>]], [[<cmd>FzfLua buffers<cr>]] },
		{ [[<C-g>]], [[<cmd>FzfLua live_grep_native<cr>]] },
		{ [[<C-s>]], [[<cmd>FzfLua git_status<cr>]] },
		{ [[<C-k>]], [[<cmd>FzfLua<cr>]] },
	},
}

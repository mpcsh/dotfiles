return {
	"hrsh7th/nvim-cmp",
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- LSP
				-- { name = 'vsnip' }, -- For vsnip users.
				-- { name = "buffer" }, -- text within the current buffer
				-- { name = "path" }, -- file system paths
			}, {
				{ name = "buffer" },
			}),
			mapping = cmp.mapping.preset.insert({
				-- ["<C-Tab>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-y>"] = cmp.mapping.scroll_docs(-1),
				["<C-e>"] = cmp.mapping.scroll_docs(1),
				["<C-l>"] = cmp.mapping.abort(), -- close completion window
				["<Tab>"] = cmp.mapping.confirm({ select = true }),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
		})
	end,
}

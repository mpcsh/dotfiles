vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

local ignoredCodes = { 6133, 6196 }
vim.lsp.config("ts_ls", {
	settings = {
		diagnostics = {
			ignoredCodes = ignoredCodes,
		},
	},
})

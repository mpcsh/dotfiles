-- see https://github.com/lewis6991/ts-install.nvim#installation
vim.g.loaded_nvim_treesitter = 1

vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" } })

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		-- pcall swallows errors when ts-install hasn't yet installed the parser for this buffer
		-- ts-install re-triggers this event after installation
		pcall(vim.treesitter.start, args.buf)
	end,
})

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	init = function()
		-- see https://github.com/lewis6991/ts-install.nvim#installation
		vim.g.loaded_nvim_treesitter = 1
	end,
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				-- pcall swallows errors when ts-install hasn't yet installed the parser for this buffer
				-- ts-install re-triggers this event after installation
				pcall(vim.treesitter.start, args.buf)
			end,
		})
	end,
}

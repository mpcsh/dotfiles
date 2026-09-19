vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter-context" })
require("treesitter-context").setup({
	mode = "cursor",
	multiline_threshold = 1,
	max_lines = vim.o.scrolloff - 1,
})

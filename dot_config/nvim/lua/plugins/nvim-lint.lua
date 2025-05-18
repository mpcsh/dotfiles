return {
	"mfussenegger/nvim-lint",
	event = { "BufNewFile", "BufReadPost" },
	config = function()
		require("lint").linters_by_ft = {
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			html = { "eslint_d" },
			css = { "eslint_d" },
			lua = { "selene" },
		}
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}

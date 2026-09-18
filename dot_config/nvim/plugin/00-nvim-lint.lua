vim.pack.add({ "https://github.com/mfussenegger/nvim-lint" })
local lint = require("lint")

lint.linters_by_ft = {
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	html = { "stylelint" },
	css = { "stylelint" },
	lua = { "selene" },
	yaml = { "yamllint" },
}

lint.linters.selene.args = { [[--config -]] }
lint.linters.selene.stdin = [[std="vim"]]

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
	callback = function()
		lint.try_lint()
	end,
})

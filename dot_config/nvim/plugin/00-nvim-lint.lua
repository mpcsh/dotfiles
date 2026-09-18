vim.pack.add({ "https://codeberg.org/mfussenegger/nvim-lint" })
local lint = require("lint")

lint.linters_by_ft = {
	css = { "stylelint" },
	html = { "stylelint" },
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	lua = { "selene" },
	toml = { "tombi" },
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	yaml = { "yamllint" },
}

vim.list_extend(lint.linters.selene.args, { "--config", os.getenv("HOME") .. "/.config/selene/selene.toml" })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
	callback = function()
		lint.try_lint()
	end,
})

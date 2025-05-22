return {
	"mfussenegger/nvim-lint",
	event = { "BufNewFile", "BufReadPost" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			html = { "eslint_d" },
			css = { "eslint_d" },
			lua = { "selene" },
			["*"] = { "codespell" },
		}

		lint.linters.selene.args = { [[--config -]] }
		lint.linters.selene.stdin = [[std="vim"]]

		lint.linters.codespell = {
			prepend_args = { "--ignore-words-list=" .. table.concat(require("utils").codespell_ignored_words, ",") },
			stdin = true,
		}

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}

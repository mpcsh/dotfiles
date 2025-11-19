return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			cpp = { "clang-format" },
			css = { "prettierd" },
			html = { "prettierd" },
			json = { "prettierd" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			lua = { "stylua" },
			md = { "prettierd" },
			rust = { "rustfmt" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			["*"] = { "codespell" },
			["_"] = { "trim_whitespace" },
		},
		format_after_save = { lsp_format = "fallback" },
		formatters = {
			codespell = {
				prepend_args = { "--ignore-words-list=" .. table.concat(require("utils").codespell_ignored_words, ",") },
			},
		},
	},
}

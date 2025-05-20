return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			cpp = { "clang-format" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			lua = { "stylua" },
			md = { "prettier" },
			rust = { "rustfmt" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			["*"] = { "codespell" },
			["_"] = { "trim_whitespace" },
		},
		format_after_save = { lsp_format = "fallback" },
	},
}

vim.pack.add({ "https://github.com/stevearc/conform.nvim" })
require("conform").setup({
	formatters_by_ft = {
		cpp = { "clang-format" },
		css = { "prettierd" },
		html = { "prettierd" },
		javascript = { "prettierd" },
		javascriptreact = { "prettierd" },
		json = { "prettierd" },
		lua = { "stylua" },
		markdown = { "prettierd" },
		rust = { "rustfmt" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		yaml = { "yamlfmt" },
		["_"] = { "trim_whitespace" },
	},
	format_on_save = { lsp_format = "fallback" },
})

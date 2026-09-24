vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

local skip_format = {
	diff = true,
	git = true,
	gitcommit = true,
	gitrebase = true,
}

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
		toml = { "tombi" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		yaml = { "yamlfmt" },
		["_"] = { "trim_whitespace" },
	},
	format_on_save = function(bufnr)
		if skip_format[vim.bo[bufnr].filetype] then
			return nil
		end
		return { lsp_format = "fallback" }
	end,
})

return {
	"mhartington/formatter.nvim",
	config = function()
		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				javascript = { require("formatter.filetypes.javascript").prettier },
				javascriptreact = { require("formatter.filetypes.javascriptreact").prettier },
				typescript = { require("formatter.filetypes.typescript").prettier },
				typescriptreact = { require("formatter.filetypes.typescriptreact").prettier },
				html = { require("formatter.filetypes.html").prettier },
				css = { require("formatter.filetypes.css").prettier },
				json = { require("formatter.filetypes.json").prettier },
				md = { require("formatter.filetypes.markdown").prettier },

				lua = { require("formatter.filetypes.lua").stylua },

				["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
			},
		})
	end,
}

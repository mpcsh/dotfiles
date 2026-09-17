vim.pack.add({ "https://github.com/Saghen/blink.lib" })
vim.pack.add({ "https://github.com/Saghen/blink.cmp" })

local cmp = require("blink.cmp")

cmp.build():pwait()

cmp.setup({
	sources = {
		default = { "lsp", "path" },
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
	keymap = {
		preset = "default",
		["<Tab>"] = { "accept", "hide", "fallback" },
	},
	cmdline = {
		keymap = { preset = "inherit" },
		completion = { menu = { auto_show = true } },
	},
})

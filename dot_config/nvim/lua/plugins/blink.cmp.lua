return {
	"Saghen/blink.cmp",
	version = "2.*",
	dependencies = { "Saghen/blink.lib" },
	build = function()
		require("blink.cmp").build():pwait()
	end,
	event = { "BufNewFile", "BufReadPost" },
	opts = {
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
	},
}

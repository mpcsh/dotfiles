return {
	"Saghen/blink.cmp",
	-- use a release tag to download pre-built binaries
	version = "1.*",
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
	},
}

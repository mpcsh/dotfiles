return {
	"Saghen/blink.cmp",
	-- use a release tag to download pre-built binaries
	version = "1.*",
	event = { "BufNewFile", "BufReadPost" },
	opts = {
		sources = {
			default = { "lsp", "path", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
		keymap = {
			-- https://cmp.saghen.dev/configuration/keymap.html#super-tab
			preset = "super-tab",
		},
	},
}

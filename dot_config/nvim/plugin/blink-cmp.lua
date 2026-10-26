vim.pack.add({ "https://github.com/Saghen/blink.lib" })
vim.pack.add({ "https://github.com/Saghen/blink.cmp" })

---@module "blink.lib"
local cmp = require("blink.cmp")

if not cmp.library_available() then
	cmp.build():on_resolve(function()
		vim.schedule(function()
			require("blink.cmp.fuzzy").set_implementation("rust")
			vim.notify("blink.cmp library compilation completed", vim.log.levels.INFO)
		end)
	end)
end

cmp.setup({
	sources = {
		default = { "lazydev", "lsp", "path" },
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},
		},
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

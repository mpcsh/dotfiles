vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
	pattern = { os.getenv("HOME") .. "/.local/share/chezmoi/*" },
	callback = function(ev)
		vim.schedule(function()
			require("chezmoi.commands.__edit").watch(ev.buf)
		end)
	end,
})

return {
	"xvzc/chezmoi.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = { "BufNewFile", "BufReadPost" },
	config = function()
		local chezmoi = require("chezmoi")
		chezmoi.setup({
			edit = {
				watch = true,
				force = false,
			},
			events = {
				on_open = {
					notification = { enable = false },
				},
				on_watch = {
					notification = { enable = false },
				},
				on_apply = {
					notification = { enable = true },
				},
			},
		})
	end,
}

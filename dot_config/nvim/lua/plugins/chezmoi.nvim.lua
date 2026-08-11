return {
	"xvzc/chezmoi.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	-- TODO: define an event. eager loading for now
	config = function()
		require("chezmoi").setup({
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

		vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
			pattern = { os.getenv("HOME") .. "/.local/share/chezmoi/*" },
			callback = function(ev)
				vim.schedule(function()
					require("chezmoi.commands.__edit").watch(ev.buf)
				end)
			end,
		})
	end,
}

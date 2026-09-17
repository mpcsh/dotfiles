vim.opt.termguicolors = true

-- tweaks layered on top of whichever colorscheme is active
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		-- remove tildes for blank lines
		vim.cmd("hi EndOfBuffer guifg=bg")

		-- italic comments
		vim.cmd("hi Comment gui=italic")

		-- closure highlighting
		vim.cmd("hi LinkDelimiter gui=bold")
		vim.cmd("hi MatchParen gui=bold")
	end,
})

vim.pack.add({ { src = "https://github.com/rose-pine/neovim", name = "rose-pine" } })
require("rose-pine").setup({
	variant = "auto",
	dark_variant = "moon",
	dim_inactive_windows = true,
	extend_background_behind_borders = true,
})
vim.cmd.colorscheme("rose-pine-moon")

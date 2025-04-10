vim.opt.list = true
-- vim.opt.listchars = "tab:• ,trail:·"

-- require("ibl").setup()

vim.opt.cursorline = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
	{ "lewis6991/gitsigns.nvim", event = { "BufNewFile", "BufReadPost" }, opts = {} },
	{
		"nvim-lualine/lualine.nvim",
		event = "UIEnter", -- TODO: this prevents lualine from loading on a bare launch with no file
		-- TODO: ORRRR apparently lazy.nvim doesn't like symlinks?! As soon as I stowed `nvim` without `--no-folding` everything works?!
		opts = {
			options = {
				theme = "catppuccin-mocha",
				component_separators = { left = "▓▒░", right = "░▒▓" },
				section_separators = { left = "▓▒░", right = "░▒▓" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "filename" },
				lualine_c = { "branch", "diff", "diagnostics" },
				lualine_x = { "" },
				lualine_y = { "filetype" },
				lualine_z = { "location" },
			},
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		event = "UIEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		keys = {
			{ [[<Leader>S]], [[NvimTreeToggle]] },
		},
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},
	{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{
		"folke/snacks.nvim",
		event = "BufReadPre",
		opts = {
			notifier = { enabled = true },
		},
		config = function()
			---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
			local progress = vim.defaulttable()
			vim.api.nvim_create_autocmd("LspProgress", {
				---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
					if not client or type(value) ~= "table" then
						return
					end
					local p = progress[client.id]

					for i = 1, #p + 1 do
						if i == #p + 1 or p[i].token == ev.data.params.token then
							p[i] = {
								token = ev.data.params.token,
								msg = ("[%3d%%] %s%s"):format(
									value.kind == "end" and 100 or value.percentage or 100,
									value.title or "",
									value.message and (" **%s**"):format(value.message) or ""
								),
								done = value.kind == "end",
							}
							break
						end
					end

					local msg = {} ---@type string[]
					progress[client.id] = vim.tbl_filter(function(v)
						return table.insert(msg, v.msg) or not v.done
					end, p)

					local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
					vim.notify(table.concat(msg, "\n"), "info", {
						id = "lsp_progress",
						title = client.name,
						opts = function(notif)
							notif.icon = #progress[client.id] == 0 and " "
								or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
						end,
					})
				end,
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		-- event = "UIEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			pickers = {
				find_files = {
					find_command = vim.split("fd --hidden --exclude .git/ -t f --strip-cwd-prefix", " "),
				},
			},
		},
		keys = {
			{ [[<Leader>\\]], [[Telescope lsp_definitions]] },
			{ [[<Leader>']], [[Telescope lsp_references]] },
			{ [[<Leader>"]], [[Telescope lsp_incoming_calls]] },
			{ [[<C-p>]], [[Telescope find_files]] },
			{ [[<C-k>]], [[Telescope]] },
		},
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "UIEnter",
		opts = {},
	},
	{
		"rgroli/other.nvim",
		main = "other-nvim",
		event = { "BufNewFile", "BufReadPost" },
		opts = {
			mappings = {
				"react",
				"rust",
				"python",
			},
		},
	},
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"wincent/terminus",
}

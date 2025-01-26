require("config.vim_options")
require("config.lazy")

-- git status in gutter
require("gitsigns").setup()

require("lualine").setup({
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
})

require("bufferline").setup({})

vim.keymap.set("n", "<Leader>l", "<Plug>(leap-forward)")
vim.keymap.set("n", "<Leader>L", "<Plug>(leap-backward)")

require("nvim-tree").setup()
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("mason").setup()
require("mason-lspconfig").setup()
local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({})
	end,

	["lua_ls"] = function()
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
	end,
})

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
		ensure_installed = { "lua", "vim", "vimdoc" },
		auto_install = true,
	},
})

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

vim.api.nvim_create_augroup("__formatter__", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWriteLock",
})

-- Set up lspconfig.
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require("lspconfig")["lua_ls"].setup({
-- 	capabilities = capabilities,
-- })
vim.opt.completeopt = "menu,menuone,noselect"

require("lint").linters_by_ft = {
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	html = { "eslint_d" },
	css = { "eslint_d" },

	lua = { "selene" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "TextChanged", "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- LSP
		-- { name = 'vsnip' }, -- For vsnip users.
		-- { name = "buffer" }, -- text within the current buffer
		-- { name = "path" }, -- file system paths
	}, {
		{ name = "buffer" },
	}),
	mapping = cmp.mapping.preset.insert({
		-- ["<C-Tab>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-y>"] = cmp.mapping.scroll_docs(-1),
		["<C-e>"] = cmp.mapping.scroll_docs(1),
		["<C-l>"] = cmp.mapping.abort(), -- close completion window
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
})

require("telescope").setup({
	pickers = {
		find_files = {
			find_command = vim.split("fd --hidden --exclude .git/ -t f --strip-cwd-prefix", " "),
		},
	},
})

-----------
-- keybinds
-----------

-- move inside of softwrapped lines
vim.keymap.set({ "n", "v" }, "j", "gj")
vim.keymap.set({ "n", "v" }, "k", "gk")

-- make H/L jump to the extreme of their lowercase counterparts
vim.keymap.set({ "n", "v" }, "H", "g^")
vim.keymap.set({ "n", "v" }, "L", "g$")

-- disable 'ex mode'
vim.keymap.set("n", "Q", "<Nop>")

-- set <Tab>, <S-Tab> to indent/unindent lines
vim.keymap.set("n", "<Tab>", ">>")
vim.keymap.set("n", "<S-Tab>", "<<")
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- clear search highlighting
vim.keymap.set({ "n", "i", "v" }, "<C-l>", function()
	vim.cmd("nohlsearch")
end, { silent = true })

-- don't yank on paste by default
vim.keymap.set("v", "p", "P", { noremap = true })
vim.keymap.set("v", "P", "p", { noremap = true })

-- create tabs
-- vim.keymap.set("n", "<Leader>t", function()
-- 	vim.cmd("tabe")
-- end)

-- cycle tabs
-- vim.keymap.set("n", "<Leader><Tab>", function()
-- 	vim.cmd("tabnext")
-- end)
-- vim.keymap.set("n", "<Leader><S-Tab>", function()
-- 	vim.cmd("tabprevious")
-- end)

-- cycle buffers
vim.keymap.set("n", "<Leader><Tab>", function()
	vim.cmd("bnext")
end)
vim.keymap.set("n", "<Leader><S-Tab>", function()
	vim.cmd("bprevious")
end)

-- go to definition, go back and forward
-- C-o goes back in the jump list; C-t goes back in the tag list, which is a subset of the jump list
-- can't use C-[, because apparently that's the same as Esc
-- https://vi.stackexchange.com/questions/24852/how-to-remove-the-mapping-from-ctrl-to-escape
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<Leader>\\", telescope.lsp_definitions, { noremap = true })
vim.keymap.set("n", "<Leader>[", "<C-o>", { noremap = true })
vim.keymap.set("n", "<Leader>]", "<C-i>", { noremap = true })
vim.keymap.set("n", "<Leader>'", telescope.lsp_references, { noremap = true })

-- open telescope
vim.keymap.set("n", "<C-p>", telescope.find_files, { noremap = true })
vim.keymap.set("n", "<C-k>", function()
	vim.cmd("Telescope")
end)

vim.keymap.set("n", "<Leader>S", require("nvim-tree.api").tree.toggle)

vim.opt.list = true
-- vim.opt.listchars = "tab:• ,trail:·"

-- require("ibl").setup()

vim.keymap.set("n", "<Leader>i", vim.diagnostic.open_float)

vim.opt.cursorline = true

-- luacheck: globals vim
vim.opt.shell = "/usr/bin/env sh"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- {
	-- "folke/tokyonight.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- opts = {},
	-- },
	-- "ellisonleao/gruvbox.nvim",
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	"tommcdo/vim-exchange",
	"tpope/vim-abolish",
	"tpope/vim-commentary",
	"tpope/vim-repeat",
	"tpope/vim-surround",

	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"mfussenegger/nvim-lint",
	"mhartington/formatter.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		enabled = false,
		opts = { mode = "cursor" },
	},

	"hrsh7th/nvim-cmp",
	"hrsh7th/vim-vsnip",
	"hrsh7th/cmp-nvim-lsp",
	-- "hrsh7th/cmp-vsnip",
	-- "hrsh7th/cmp-buffer",
	-- "hrsh7th/cmp-path",

	"lewis6991/gitsigns.nvim",
	"ggandor/leap.nvim",
	"nvim-lualine/lualine.nvim",
	-- "sheerun/vim-polyglot",
	"tpope/vim-fugitive",
	"wincent/terminus",

	{ "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
})

--------------
-- colorscheme
--------------
vim.opt.termguicolors = true
vim.opt.title = true

-- let g:gruvbox_material_palette = "material"
-- let g:gruvbox_material_background = "medium"
-- let g:gruvbox_material_sign_column_background = "none"
-- silent! colorscheme gruvbox-material
-- let ayucolor="mirage"
-- silent! colorscheme ayu
vim.cmd("colorscheme catppuccin-mocha")

-- remove tildes for blank lines
-- hi EndOfBuffer guifg=bg
vim.cmd("hi EndOfBuffer guifg=bg")

-- italic comments
-- hi Comment gui=italic
vim.cmd("hi Comment gui=italic")

-- closure highlighting
-- hi LinkDelimiter gui=bold
-- hi MatchParen gui=bold
vim.cmd("hi LinkDelimiter gui=bold")
vim.cmd("hi MatchParen gui=bold")

-- vim.cmd("hi TreeSitterContextBottom gui=none")

--------------
-- environment
--------------
-- show line numbers
vim.opt.number = true

-- always show sign column to prevent shifting due to diagnostics when the sign
-- column isn't already showing
vim.opt.signcolumn = "yes"

-- no startup message
vim.opt.shortmess:append({ I = true })

-- x clipboard access
vim.opt.clipboard:append("unnamedplus")

-- case-insensitive searching - case-sensitive if uppercase letters are used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- disable swap files
-- set noswapfile
vim.opt.swapfile = false

-- persistent backups
local backupdir = vim.fn.stdpath("cache") .. "backup"
if not vim.loop.fs_stat(backupdir) then
	vim.fn.system({ "mkdir", "-p", backupdir })
end
vim.opt.backup = true
vim.opt.writebackup = true
vim.opt.backupdir = backupdir

-- persistent undo
local undodir = vim.fn.stdpath("cache") .. "undo"
if not vim.loop.fs_stat(undodir) then
	vim.fn.system({ "mkdir", "-p", undodir })
end
vim.opt.undofile = true
vim.opt.undodir = undodir

-- spellchecking
-- set spellfile=$HOME/.cache/nvim/spellfile.utf-8.add
-- autocmd BufNewFile,BufRead *.md setlocal spell

-- don't keep commenting on enter or o/O
-- autocmd BufNewFile,BufRead * setlocal formatoptions-=ro
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "r", "o" })
	end,
})

-- 2-space width tabs
-- set tabstop=2
-- set shiftwidth=2
-- set expandtab
vim.opt.tabstop = 2
-- uses tabstop value when set to zero
vim.opt.shiftwidth = 0

-- set up line wrapping http://vimcasts.org/episodes/soft-wrapping-text/
vim.opt.wrap = true
vim.opt.linebreak = true

-- vsplit right, hsplit down
vim.opt.splitright = true
vim.opt.splitbelow = true

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

vim.filetype.add({
	filename = {
		["justfile"] = "just",
	},
})

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		javascript = { require("formatter.filetypes.javascript").prettier },
		typescript = { require("formatter.filetypes.typescript").prettier },
		typescriptreact = { require("formatter.filetypes.typescriptreact").prettier },
		html = { require("formatter.filetypes.html").prettier },
		css = { require("formatter.filetypes.css").prettier },
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
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	html = { "eslint_d" },
	css = { "eslint_d" },

	lua = { "luacheck" },
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

-- better leader key
vim.g.mapleader = "\\"

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

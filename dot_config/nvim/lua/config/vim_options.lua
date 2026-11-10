-- avoid using fish for plugin shell scripts
-- (c.f. https://github.com/LunarVim/LunarVim/issues/1980)
vim.opt.shell = "/usr/bin/env sh"

vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

require("vim._core.ui2").enable({
	msg = {
		targets = "msg",
	},
})

vim.api.nvim_create_autocmd("LspProgress", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local value = ev.data.params.value
		if not client or type(value) ~= "table" then
			return
		end
		vim.api.nvim_echo({ { value.message or (value.kind == "end" and "done" or "") } }, false, {
			id = "lsp." .. client.id .. "." .. ev.data.params.token,
			kind = "progress",
			source = client.name,
			title = value.title,
			status = value.kind == "end" and "success" or "running",
			percent = value.kind == "end" and 100 or value.percentage,
		})
	end,
})

--------------
-- colorscheme
--------------
vim.opt.title = true

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

vim.opt.tabstop = 2
-- uses tabstop value when set to zero
vim.opt.shiftwidth = 0
-- vim.opt.expandtab = true

-- set up line wrapping http://vimcasts.org/episodes/soft-wrapping-text/
vim.opt.wrap = true
vim.opt.linebreak = true

-- vsplit right, hsplit down
vim.opt.splitright = true
vim.opt.splitbelow = true

-- show whitespace
vim.opt.list = true
-- vim.opt.listchars = "tab:• ,trail:·"

-- highlight current line
vim.opt.cursorline = true

-- prevent the cursor from overlapping treesitter-context
vim.opt.scrolloff = 9

-- disable netrw (:h netrw-noload)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set up lspconfig.
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require("lspconfig")["lua_ls"].setup({
-- 	capabilities = capabilities,
-- })
vim.opt.completeopt = "menu,menuone,noselect"

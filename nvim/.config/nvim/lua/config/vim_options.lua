-- avoid using fish for plugin shell scripts
-- (c.f. https://github.com/LunarVim/LunarVim/issues/1980)
vim.opt.shell = "/usr/bin/env sh"

vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

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

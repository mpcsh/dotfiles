local bind = vim.keymap.set

-- splits
bind("n", "<C-w>-", function()
	vim.cmd("split")
end)
bind("n", "<C-w>\\", function()
	vim.cmd("vsplit")
end)

-- lsp functions
bind("n", "<Leader>i", vim.diagnostic.open_float)
bind("n", "<Leader>?", vim.lsp.buf.hover)

-- go to definition, go back and forward
-- C-o goes back in the jump list; C-t goes back in the tag list, which is a subset of the jump list
-- can't use C-[, because apparently that's the same as Esc
-- https://vi.stackexchange.com/questions/24852/how-to-remove-the-mapping-from-ctrl-to-escape
bind("n", "<Leader>[", "<C-o>", { noremap = true })
bind("n", "<Leader>]", "<C-i>", { noremap = true })

-- move inside of softwrapped lines
bind({ "n", "v" }, "j", "gj")
bind({ "n", "v" }, "k", "gk")

-- make H/L jump to the extreme of their lowercase counterparts
bind({ "n", "v" }, "H", "g^")
bind({ "n", "v" }, "L", "g$")

-- disable 'ex mode'
bind("n", "Q", "<Nop>")

-- set <Tab>, <S-Tab> to indent/unindent lines
bind("n", "<Tab>", ">>")
bind("n", "<S-Tab>", "<<")
bind("v", "<Tab>", ">gv")
bind("v", "<S-Tab>", "<gv")

-- clear search highlighting
bind({ "n", "i", "v" }, "<C-l>", function()
	vim.cmd("nohlsearch")
end, { silent = true })

-- don't yank on paste by default
bind("v", "p", "P", { noremap = true })
bind("v", "P", "p", { noremap = true })

-- create tabs
-- bind("n", "<Leader>t", function()
-- 	vim.cmd("tabe")
-- end)

-- cycle tabs
-- bind("n", "<Leader><Tab>", function()
-- 	vim.cmd("tabnext")
-- end)
-- bind("n", "<Leader><S-Tab>", function()
-- 	vim.cmd("tabprevious")
-- end)

-- cycle buffers
bind("n", "<Leader><Tab>", function()
	vim.cmd("bnext")
end)
bind("n", "<Leader><S-Tab>", function()
	vim.cmd("bprevious")
end)

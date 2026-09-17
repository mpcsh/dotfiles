vim.pack.add({ "https://github.com/nvim-tree/nvim-web-devicons" })
vim.pack.add({ "https://github.com/nvim-tree/nvim-tree.lua" })
require("nvim-tree").setup({})
vim.keymap.set("n", [[<Leader>S]], [[<cmd>NvimTreeFindFileToggle<cr>]])

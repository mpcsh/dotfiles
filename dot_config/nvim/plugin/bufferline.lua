vim.pack.add({ "https://github.com/nvim-tree/nvim-web-devicons" })
-- latest tagged release
vim.pack.add({ { src = "https://github.com/akinsho/bufferline.nvim", version = vim.version.range("*") } })
require("bufferline").setup({})

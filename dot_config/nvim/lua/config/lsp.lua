local lsp_log = vim.fn.stdpath("state") .. "/lsp.log"
local lsp_log_stat = vim.uv.fs_stat(lsp_log)
if lsp_log_stat and lsp_log_stat.size > 10 * 1024 * 1024 then
	os.rename(lsp_log, vim.fn.stdpath("state") .. "/" .. os.date("%Y-%m-%dT%H:%M:%S") .. ".lsp.log")
end
vim.lsp.log.set_level(vim.log.levels.WARN)

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "hs", "vim" },
			},
		},
	},
})

local ignoredCodes = { 6133, 6196 }
vim.lsp.config("ts_ls", {
	settings = {
		diagnostics = {
			ignoredCodes = ignoredCodes,
		},
	},
})

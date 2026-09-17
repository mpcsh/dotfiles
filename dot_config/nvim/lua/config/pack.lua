local log = vim.fn.stdpath("log") .. "/nvim-pack.log"
local one_day = 24 * 60 * 60

vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		if vim.fn.executable("rg") == 0 then
			vim.notify("can't check last vim.pack update time: `rg` not found", vim.log.levels.WARN)
			return nil
		end
		local rg = vim.system({
			"rg",
			"--only-matching",
			"--replace=$1",
			[[^========== Update (\d+-\d+-\d+ \d+:\d+:\d+) ==========$]],
			log,
		}, { text = true }):wait()
		if rg.code ~= 0 then
			vim.notify("can't check last vim.pack update time: no timestamps found in " .. log, vim.log.levels.WARN)
			return nil
		end
		local last = vim.system({ "tail", "-n", "1" }, { stdin = rg.stdout, text = true }):wait().stdout
		local last_updatetime = vim.fn.strptime("%Y-%m-%d %H:%M:%S", last)
		if last_updatetime and os.time() - last_updatetime > one_day then
			vim.pack.update(nil, { force = true })
		end
	end,
})
